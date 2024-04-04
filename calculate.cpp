#include "calculate.h"
#include <QRegularExpression>
#include <QDebug>

Calculate::Calculate(QObject *parent)
    : QObject{parent}
{}

double Calculate::DoIt(TypeWork typeWork, double operandA, double operandB) noexcept(false)
{
    switch (typeWork) {
    case addition:
        return ((operandA + operandB) > operandA) ? operandA + operandB : throw std::logic_error("Переполнение буфера при сложении");
        break;
    case subtraction:
        return ((operandA - operandB) < operandA) ? operandA - operandB : throw std::logic_error("Переполнение буфера при вычитании");
        break;
    case division:
        return operandB != 0 ? operandA / operandB : throw std::logic_error("Деление на ноль");
        break;
    case multiplication:
        return ((operandA * operandB) > operandA) ? operandA * operandB : throw std::logic_error("Переполнение буфера при умножении");
        break;
    default:
        break;
    }
    return 0;
}

void Calculate::MakeWorkList(QString work)
{
    QStringList numbersList = work.split(QRegularExpression("\\/|\\-|\\+|\\*|\\="));
    QList <TypeWork> operationList;
    int operationPosition = 0;
    for(int i = 0; i < (numbersList.size() -1) ; ++i){
        operationPosition += numbersList[i].size();
        switch (work.at(operationPosition).toLatin1()) {
        case '+':
            operationList.push_back(addition);
            break;
        case '-':
            operationList.push_back(subtraction);
            break;
        case '/':
            operationList.push_back(division);
            break;
        case '*':
            operationList.push_back(multiplication);
            break;
        default:
            break;
        }
        ++operationPosition;
    }
    firstOperand = numbersList[0].toDouble();

    for(int i = 0; i < (operationList.size()) ; ++i){
        workList.push_back(qMakePair(operationList[i],numbersList[i + 1].toDouble()));
    }
}

void Calculate::DoCalculation(QString someWork)
{
    MakeWorkList(someWork);
    result = firstOperand;

    try{
        for(int i = 0; i < workList.size(); ++i){
            result = DoIt(workList[i].first, result, workList[i].second);
        }
    }
    catch (const std::logic_error ex){
        qDebug() << "\e[31m!ERROR: " << ex.what() << "\e[0m\n";
    }
}

double Calculate::getResult() const
{
    return result;
}
