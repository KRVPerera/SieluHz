#include "Timeout.h"

Timeout::Timeout(QObject * parent)
    : QObject{parent}, _clock(0) {}

void Timeout::calculate(QVariant data) {
    bool isNum;

    int input = data.toInt(&isNum);
    int output = 0;
    if (!isNum) {
        qWarning() << "Not a number";
    }

    output = 100;

    emit calculatedNumber(QVariant(output));
}


void Timeout::setClock(int value) {
    _clock = value;
}

int Timeout::clock() {
    return _clock;
}
