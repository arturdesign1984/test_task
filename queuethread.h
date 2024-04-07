#ifndef QUEUETHREAD_H
#define QUEUETHREAD_H

#include <QObject>
#include <QThread>
#include <QMutex>
#include <QQueue>
#include <QProcess>
#include "calculate.h"

class QueueThread : public QObject
{
    Q_OBJECT
public:
    explicit QueueThread(QObject *parent = nullptr);
    ~QueueThread();

signals:
    void queueRequChanged(int);
    void queueResuChanged(int);
    void beginWork(QString);

public slots:
    void addRequest(const QString);
    void addResult(const double);

private:
    void showResults();
    QQueue<QString> queueRequests;
    QQueue<double> queueRsults;
    bool inWork;
    Calculate* calculate;
    QThread* calculateThread;
    QMutex mtx;
    QProcess* cmd;
};

#endif // QUEUETHREAD_H
