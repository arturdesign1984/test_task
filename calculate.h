#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>

class Calculate : public QObject
{
    Q_OBJECT

private:
    enum TypeWork {addition, subtraction, division, multiplication};
    QList <QPair <TypeWork, double>> workList;
    double firstOperand;
    double result;

public:
    explicit Calculate(QObject *parent = nullptr);

    double DoIt (TypeWork typeWork, double operandA, double operandB) noexcept(false);
    void MakeWorkList(QString);
    void DoCalculation(QString);
    double getResult() const;

signals:
    // emit AddToQueueResults(double);
};

#endif // CALCULATE_H
