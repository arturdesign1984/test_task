#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calculate.h"
#include "queuehandler.h"
#include "queuethread.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Calculate cal();


    // cal.doCalculation("5+5-6/2=02");

    // qDebug() << cal.getResult();

    qmlRegisterType<QueueHandler>("QueueHandler", 1, 0, "QueueHandler");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/test_task/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
