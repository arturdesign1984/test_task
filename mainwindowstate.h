#ifndef MAINWINDOWSTATE_H
#define MAINWINDOWSTATE_H

#include <QObject>
#include <QPoint>
#include <QSize>


class MainWindowState : public QObject
{
    Q_OBJECT
public:
    explicit MainWindowState(QObject *parent = nullptr);
    Q_INVOKABLE void saveState();
    Q_INVOKABLE void restoreState(QPoint &pos, QSize &size);
    Q_INVOKABLE int getWindowPositionX() const;
    Q_INVOKABLE int getWindowPositionY() const;
    Q_INVOKABLE int getWindowWidth() const;
    Q_INVOKABLE int getWindowHeight() const;
    Q_INVOKABLE void setWindowPositionX(int);
    Q_INVOKABLE void setWindowPositionY(int);
    Q_INVOKABLE void setWindowWidth(int);
    Q_INVOKABLE void setWindowHeight(int);

private:
    QPoint windowPosition;
    QSize windowSize;
};

#endif // MAINWINDOWSTATE_H
