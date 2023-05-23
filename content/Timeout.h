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

class Timeout : public QObject {
    Q_OBJECT
    Q_PROPERTY(int clok READ clock WRITE setClock NOTIFY clockChanged)
    QML_ELEMENT
//    QML_SINGLETON

 public:
    explicit Timeout(QObject *parent = nullptr);
    void setClock(int value);
    int clock();

 signals:
      void calculatedNumber(QVariant data);
      void clockChanged();

 public slots:
    void calculate(QVariant data);

 private:
   int _clock;
};
