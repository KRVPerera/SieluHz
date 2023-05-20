// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Window {
    width: 640
    height: 800
    visible: true
    title: "SieluHz"
    color: Constants.color_50

    ColumnLayout {
        anchors.fill: parent
        SwipeView {
            id: viewMain
            currentIndex: 0
            anchors.fill: parent
//            anchors.margins: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Pane {
//                width: viewMain.width
//                height: viewMain.height
                Screen01 {
                    id: mainScreen
                }
            }

            Pane {
//                width: viewMain.width
//                height: viewMain.height
                EffectsScreen {
                    id: swipeScreen
                }
            }
        }

        PageIndicator {
            count: viewMain.count
            currentIndex: viewMain.currentIndex
            anchors.bottom: parent.bottom
            interactive: true
            anchors.horizontalCenter: parent.horizontalCenter
            delegate: Rectangle {
                implicitWidth: 8
                implicitHeight: 8

                radius: width / 2
                color: Constants.color_900

                opacity: index === viewMain.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }
                }
            }

        }  // PageIndicator
    }  // ColumnLayout
}  // Window

