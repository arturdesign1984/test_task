#ifndef DOITEXT_H
#define DOITEXT_H

#include "doItExt_global.h"
#include <QObject>

class DOITEXT_EXPORT DoItExt : public QObject
{
    Q_OBJECT

public:
    explicit DoItExt(QObject *parent = nullptr);
    double doItExt (int typeWork, double operandA, double operandB) noexcept(false);
};

#endif // DOITEXT_H
