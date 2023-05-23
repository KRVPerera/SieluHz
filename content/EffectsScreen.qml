import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Rectangle {
    id: effectRectangle
    color: Constants.color_50
    anchors.fill: parent
    anchors.margins: 0
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 2
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignCenter

        Text {
            text: "@string/CUTTER_MESSAGE"
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 60
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: fileContentText
            text: ""
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 50
            Layout.alignment: Qt.AlignCenter
        }

        RoundButton {
            text: "Load String resource with key : CUTTER_MESSAGE"
            Layout.alignment: Qt.AlignCenter
            //            Layout.fillWidth: true
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100

            onClicked: {
                // Update the text in the resultText
                fileContentText.text = loadFileFromAssets("res/values:/cutter.xml")
            }
        }
    }
}
