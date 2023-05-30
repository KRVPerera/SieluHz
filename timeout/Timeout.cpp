#include "Timeout.h"

// QObject *Timeout::theInstance = nullptr;
Timeout::Timeout(QObject *parent)
    : QObject(parent), m_clock(0), m_ticks(0)
{
    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &Timeout::increaseClock);
    m_ticker = new QTimer(this);
    connect(m_ticker, &QTimer::timeout, this, &Timeout::increaseTicks);
}

void Timeout::initClock()
{
    m_timer->stop();
    m_timer->start(1000);
}

void Timeout::initTicks()
{
    m_ticker->stop();
    m_ticker->start(100);
}

int Timeout::clock()
{
    return m_clock;
}

int Timeout::ticks()
{
    return m_ticks;
}

void Timeout::setClock(int value)
{
    if (m_clock == value)
        return;

    m_clock = value;
    emit clockChanged(m_clock);
}

void Timeout::setTicks(int value)
{
    if (m_ticks == value)
        return;

    m_ticks = value;
    emit tickChanged(m_ticks);
}
