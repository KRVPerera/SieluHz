#pragma once

#include <QObject>
#include <QVariant>
#include <QtQml>
#include <qqml.h>
#include <QtQml/qqmlregistration.h>

/**
 * @brief The Timeout class which provide sleep function
 * This is written following
 * "How to add C++ to a QML project" https://www.youtube.com/watch?v=knlH_NF8PAs
 */

class Timeout : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int clock READ clock WRITE setClock NOTIFY clockChanged)
    Q_PROPERTY(int ticks READ ticks WRITE setClock NOTIFY clockChanged)
    QML_ELEMENT
    QML_SINGLETON
    Q_DISABLE_COPY(Timeout)

public:
    Timeout(QObject *parent = nullptr);

    virtual ~Timeout() = default;

    static Timeout *create(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
    {
        Q_UNUSED(qmlEngine);
        Q_UNUSED(jsEngine);

        Timeout *theInstance = new Timeout();
        return theInstance;
    }

    void setClock(int value);
    void setTicks(int value);
    Q_INVOKABLE void initClock();
    Q_INVOKABLE void initTicks();
    int clock();
    int ticks();

signals:
    void clockChanged(int clock);
    void tickChanged(int tick);

private slots:
    void increaseClock()
    {
        setClock(m_clock + 1);
    }

    void increaseTicks()
    {
        setTicks(m_ticks + 1);
    }

private:
    int m_clock;
    int m_ticks;
    QTimer *m_timer;
    QTimer *m_ticker;
};