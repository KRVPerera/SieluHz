import QtQuick 6.2
//import SieluHz
import QtQuick.Layouts
import QtQuick.Controls 6.2


/**
  * This is taken from QML examples
  * QT - QML Advanced Tutorial 1,2,3,4
  */
Rectangle {
    id: gameScreen
    color: "#004D40"
    anchors.fill: parent
    Layout.fillWidth: true

    ColumnLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        spacing: 0

        Rectangle {
            id: background
            color: "#64FFDA"
            height: 400
            Layout.fillWidth: true
            Layout.fillHeight: true
            anchors.margins: 0
        }

        RowLayout {
            id: toolBar
            height: parent.height - background.height
            spacing: 0

            Button {
                text: "New Game"
                onClicked: console.log("This is blank")
                height: parent.height
                Layout.leftMargin: 10
                Layout.bottomMargin: 10
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                id: score
                text: "Score: 0    "
                height: parent.height
                color: "#FFFFFF"
                antialiasing: true
                font.pixelSize: 25
                anchors.right: gameScreen.Right
             }
        }  // RowLayout
    }  // ColumnLayout
}  // Rectangle
