#include "Timeout.h"

// QObject *Timeout::theInstance = nullptr;
Timeout::Timeout(QObject *parent)
    : QObject(parent), m_clock(0)
{
}

void Timeout::initClock()
{
    m_clock = 0;
    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &Timeout::increaseClock);
    m_timer->start(1000);
}

int Timeout::clock()
{
    return m_clock;
}

void Timeout::setClock(int value)
{
    if (m_clock == value)
        return;

    m_clock = value;
    emit clockChanged(m_clock);
}
