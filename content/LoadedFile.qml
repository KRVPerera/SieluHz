

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
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 1
        anchors.bottomMargin: 5
        anchors.fill: parent
        antialiasing: true
        Layout.alignment: Qt.AlignCenter

        Text {
            text: "File assets:/cutter.txt"
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 60
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: fileContentText
            text: "DUMMY"
            wrapMode: Text.Wrap
            antialiasing: true
            font.pixelSize: 50
            Layout.alignment: Qt.AlignCenter
        }

        RoundButton {
            id: loadButton
            text: "Load File"
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100

            onClicked: {
                fileContentText.text = loadFileFromAssets("assets:/cutter.txt")
            }

            contentItem: Text {
                text: loadButton.text
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
