#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>
#include "DoITExt/include/doitext.h"

class Calculate : public QObject
{
    Q_OBJECT

private:
    enum TypeWork {addition, subtraction, division, multiplication};
    QList <QPair <TypeWork, double>> workList;
    double firstOperand;
    double result;
    DoItExt doItExtLib;

public:
    explicit Calculate(QObject *parent = nullptr);

    double doIt (TypeWork typeWork, double operandA, double operandB) noexcept(false);
    void makeWorkList(QString);
    void doCalculation(const QString);

public slots:
    void begin(QString);

private slots:
    void setNextWork();

signals:
    void addToQueueResults(double);
};

#endif // CALCULATE_H
