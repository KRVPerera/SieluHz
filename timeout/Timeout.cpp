#include "Timeout.h"

// QObject *Timeout::theInstance = nullptr;
Timeout::Timeout(QObject *parent)
    : QObject(parent), m_clock(0)
{

    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &Timeout::increaseClock);
    m_timer->start(1000);
}

// void Timeout::calculate(QVariant data)
//{
//     bool isNum;

//    int input = data.toInt(&isNum);
//    int output = 0;
//    if (!isNum)
//    {
//        qWarning() << "Not a number";
//    }

//    output = 100;

//    emit calculatedNumber(QVariant(output));
//}

// static QObject *myObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
//{
//     Q_UNUSED(engine)
//     Q_UNUSED(scriptEngine)

//    Timeout *myObject = new Timeout();
//    return myObject;
//}

// void Timeout::setClock(int value)
//{
//     _clock = value;
// }

// int Timeout::clock()
//{
//     return _clock;
// }
