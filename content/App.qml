// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Window {
    width: 680
    height: 900
    visible: true
    title: "SieluHz"
    color: Constants.color_50

    function getStringResource(key) {
        return QtAndroid.callQtAndroidActivityMethod("getStringResource", key);
    }

    function loadFileFromAssets(filePath) {
        var fileContent = "";
        var fileRequest = new XMLHttpRequest();
        fileRequest.open("GET", filePath, false);
        fileRequest.send();
        if (fileRequest.status === 200) {
            fileContent = fileRequest.responseText;
        } else {
            console.log("Failed to open file:", fileRequest.statusText);
        }
        return fileContent;
    }

    ColumnLayout {
        anchors.fill: parent

        SwipeView {
            id: viewMain
            currentIndex: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Pane {
                padding: 0
                MemoryGame {
                    id: memory
                }
            }

            Pane {
                padding: 0
                Screen01 {
                    id: mainScreen
                }
            }

            Pane {
                padding: 0
                EffectsScreen {
                    id: loadTextResource
                }
            }

            Pane {
                padding: 0
                LoadedFile {
                    id: loadFile
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
                id: pageIndicatorButton
                implicitWidth: 20
                implicitHeight: 20

                radius: width / 2
                color: Constants.color_900

                opacity: index === viewMain.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }
                }
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 22
                color: Constants.colorAccent1
                border {
                    width: 1
                    color: Qt.darker(activePalette.button)
                }
                antialiasing: true
                radius: 15
            }

        }  // PageIndicator
    }  // ColumnLayout
}  // Window

