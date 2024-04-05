#include "queuethread.h"
#include <QDebug>

QueueThread::QueueThread(QObject *parent)
    : QObject{parent}
{
    calculateThread = new QThread();
    calculate = new Calculate();
    connect(calculate, SIGNAL(addToQueueResults(double)),this, SLOT(addResult(double)));
    connect(this, SIGNAL(beginWork(QString)),calculate, SLOT(begin(QString)));
    calculate->moveToThread(calculateThread);
    calculateThread->start();
}

void QueueThread::addRequest(const QString work){
    mtx.lock();
    queueRequests.push_back(work);
    emit queueRequChanged(queueRequests.length());
    if(queueRequests.length() == 1){
        emit beginWork(queueRequests.first());
    }
    qDebug() << "\e[32mЗадача: " << work.sliced(0,work.indexOf("=")) << "\e[0m ";
    mtx.unlock();
}

void QueueThread::addResult(const double result){
    mtx.lock();
    queueRsults.push_back(result);
    emit queueResuChanged(queueRsults.length());
    if(queueRequests.length() == 1){
        queueRequests.pop_front();
        emit queueRequChanged(queueRequests.length());
    } else if(queueRequests.length() > 1){
        queueRequests.pop_front();
        emit queueRequChanged(queueRequests.length());
        emit beginWork(queueRequests.first());
    }
    mtx.unlock();
    showResults();
}

void QueueThread::showResults()
{
    mtx.lock();
    qDebug() << "\e[34mОтвет: " << queueRsults.first() << "\e[0m\n";
    queueRsults.pop_front();
    emit queueResuChanged(queueRsults.length());
    mtx.unlock();
}
