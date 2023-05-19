import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Rectangle {
    id: effectRectangle
    color: Constants.color_50
    width: 400
    height: 600
    anchors.fill: parent
    anchors.margins: 0

    ColumnLayout {
        width: parent.width
        height: parent.height
        spacing: 2
        anchors.centerIn: parent
        anchors.fill: parent
        Layout.alignment: Qt.AlignCenter

        Rectangle {
            width: parent.width
            height: parent.height / 14
            color: Constants.colorPrimary
            Layout.fillHeight: true
        }
    }
}
