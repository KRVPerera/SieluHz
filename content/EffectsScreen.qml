import QtQuick 6.2
import QtQuick.Controls 6.2
import SieluHz
import QtQuick.Layouts

Rectangle {
    id: effectRectangle
    color: Constants.color_50
    anchors.fill: parent

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 1
        anchors.bottomMargin: 5
        anchors.fill: parent
        antialiasing: true
        Layout.alignment: Qt.AlignCenter

        Text {
            text: "@string/CUTTER_MESSAGE"
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 30
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: stringContent
            text: qsTr("CUTTER_MESSAGE")
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 30
            Layout.alignment: Qt.AlignCenter
        }

        RoundButton {
            id: loadStringButton
            text: "Load String"
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100

            onClicked: {
                stringContent.text = loadFileFromAssets("res/values:/cutter.xml")
            }

            contentItem: Text {
                text: loadStringButton.text
                opacity: enabled ? 1.0 : 0.3
                color: saveButton.down ? buttonTextColor : buttonTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.pointSize: 15
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: saveButton.down ? buttonPressedColor : buttonColor
                border {
                    width: 2
                    color: Qt.darker(activePalette.button)
                }
                antialiasing: true
                radius: 20
            }
        }
    }
}
