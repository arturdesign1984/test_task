#include "queuehandler.h"
#include <QDebug>
#include <QRegExp>

QueueHandler::QueueHandler(QObject *parent) : QObject(parent)
{
    queThread = new QueueThread(this);

    connect(queThread, SIGNAL(queueResuChanged(int)), this, SLOT(queueResultWorkDone(int)));
    connect(queThread, SIGNAL(queueRequChanged(int)), this, SLOT(queueRequestWorkDone(int)));
    connect(this, SIGNAL(addRequestToQueue(const QString)), queThread, SLOT(addRequest(const QString)));

}

void QueueHandler::addToQueueRequests(const QString& work)
{
    QRegExp re ("^[0-9]+[.]?[0-9]*([-+/*]?[0-9]+[.]?[0-9]*)+[=][0-9]+$");

    if(re.exactMatch(work))
    {
        emit addRequestToQueue(work);
        emit queueRequestsChanged(queueRequestsLength);
    } else
    {
        qWarning() << "\e[31m!ERROR: Некорректный ввод \e[0m\n";
    }
}

void QueueHandler::queueResultWorkDone(int length)
{
    queueResultsLength = length;
    emit queueResultsChanged(queueResultsLength);
}

void QueueHandler::queueRequestWorkDone(int length)
{
    queueRequestsLength = length;
    emit queueRequestsChanged(queueRequestsLength);
}

int QueueHandler::getQueueResultsLength() const
{
    return queueResultsLength;
}

int QueueHandler::getQueueRequestsLength() const
{
    return queueRequestsLength;
}
