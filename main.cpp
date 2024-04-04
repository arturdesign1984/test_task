#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calculate.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Calculate cal;

    cal.DoCalculation("5+5-6/0=02");

    qDebug() << cal.getResult();

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
