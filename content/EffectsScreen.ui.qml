import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Rectangle {
    id: effectRectangle
    color: Constants.color_50
    width: 640
    height: 800
    anchors.fill: parent
    anchors.margins: 0

    ColumnLayout {
        width: 620
        height: 780
        spacing: 2
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignCenter

        Label {
            color: Constants.colorBlack
            text: "@string/cutter"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
            anchors.margins: 0
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: parent.width
            height: parent.height / 14
            color: Constants.colorPrimary
        }
    }
}
