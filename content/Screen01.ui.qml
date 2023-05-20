

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Rectangle {
    id: rectangle
    color: Constants.color_50
    width: 640
    height: 800
    anchors.fill: parent

    ColumnLayout {
        width: 620
        height: parent.height

        spacing: 1
        //        anchors.centerIn: parent
        anchors.bottomMargin: 5
        anchors.fill: parent
        antialiasing: false
        Layout.alignment: Qt.AlignCenter

        Label {
            color: Constants.colorBlack
            text: "Colors Palettes"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
            anchors.margins: 0
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.colorPrimary
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.colorAccent1
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.colorAccent2
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.colorAccent3
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_900
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_800
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_700
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_600
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_400
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_300
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_200
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height / 16
            color: Constants.color_100
            Layout.alignment: Qt.AlignCenter
        }
    }
}
