#ifndef QUEUEHANDLER_H
#define QUEUEHANDLER_H

#include <QObject>
#include "queuethread.h"

class QueueHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int queueRequestsLength READ getQueueRequestsLength NOTIFY queueRequestsChanged)
    Q_PROPERTY(int queueResultsLength READ getQueueResultsLength NOTIFY queueResultsChanged)
public:
    explicit QueueHandler(QObject *parent = nullptr);

    int getQueueRequestsLength() const;
    int getQueueResultsLength() const;

signals:
    void queueRequestsChanged(int);
    void queueResultsChanged(int);
    void addRequestToQueue(const QString);

public slots:
    void addToQueueRequests(const QString&);
    void queueResultWorkDone(int);
    void queueRequestWorkDone(int);

private:
    int queueRequestsLength;
    int queueResultsLength;
    QueueThread* queThread;
};

#endif // QUEUEHANDLER_H
