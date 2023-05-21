

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
        //        width: 620
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 1
        //        anchors.centerIn: parent
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
            text: "Load File"
            Layout.alignment: Qt.AlignCenter
            //            Layout.fillWidth: true
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100

            onClicked: {
                // Update the text in the resultText
                fileContentText.text = loadFileFromAssets("assets:/cutter.txt")
            }
        }
    }
}
