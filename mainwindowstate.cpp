#include "mainwindowstate.h"

#include <QSettings>

MainWindowState::MainWindowState(QObject *parent) : QObject(parent)
{
    restoreState(windowPosition, windowSize);
}

void MainWindowState::saveState()
{
    QSettings settings("SmirnovAV", "PosSize");
    settings.beginGroup("MainWindow");
    settings.setValue("pos", windowPosition);
    settings.setValue("size", windowSize);
    settings.endGroup();
}

void MainWindowState::restoreState(QPoint &pos, QSize &size)
{
    QSettings settings("SmirnovAV", "PosSize");
    settings.beginGroup("MainWindow");
    QPoint oldPoint = settings.value("pos", QPoint(0, 0)).toPoint();
    if (oldPoint.x()!=0 && oldPoint.y()!=0) //check if there old values
    {
        pos.setX(oldPoint.x());
        pos.setY(oldPoint.y());
    }

    QSize oldSize = settings.value("size", QSize(0, 0)).toSize();
    if (oldSize.width()!=0 && oldSize.height()!=0) //check if there old values
    {
        size.setWidth(oldSize.width());
        size.setHeight(oldSize.height());
    } else
    {
        size.setWidth(320);
        size.setHeight(480);
    }

    settings.endGroup();
}

int MainWindowState::getWindowPositionX() const
{
    return windowPosition.x();
}

int MainWindowState::getWindowPositionY() const
{
    return windowPosition.y();
}

int MainWindowState::getWindowWidth() const
{
    return windowSize.width();
}

int MainWindowState::getWindowHeight() const
{
    return windowSize.height();
}

void MainWindowState::setWindowPositionX(int posX)
{
    windowPosition.setX(posX);
}

void MainWindowState::setWindowPositionY(int posY)
{
    windowPosition.setY(posY);
}

void MainWindowState::setWindowWidth(int width)
{
    windowSize.setWidth(width);
}

void MainWindowState::setWindowHeight(int height)
{
    windowSize.setHeight(height);
}

