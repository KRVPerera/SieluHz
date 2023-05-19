// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz

Window {
    width: 640
    height: 800
    visible: true
    title: "SieluHz"

    SwipeView {
        id: viewMain
        currentIndex: 0
        anchors.fill: parent
        anchors.margins: 0

        Pane {
            width: viewMain.width
            height: viewMain.height
            anchors.margins: 0
            Screen01 {
                id: mainScreen
            }
        }

        Pane {
            width: viewMain.width
            height: viewMain.height
            anchors.margins: 0
            EffectsScreen {
                id: swipeScreen
            }
        }
    }

    PageIndicator {
        count: viewMain.count
        currentIndex: viewMain.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

