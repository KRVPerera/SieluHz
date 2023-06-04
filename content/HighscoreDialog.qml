import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import SieluHz
import gamedata
import Qt.labs.qmlmodels

Dialog {
    id: container
    modal: true
    visible: false
    title: "High Scores"

    property var tableData: [{
            "name": "cat",
            "score": "black"
        }]

    property color buttonTextColor: Constants.gold_bg_text_100
    property color buttonColor: Constants.gold_bg_900
    property color buttonPressedColor: Constants.gold_bg_100
    property double fontPointSize: Constants.fontPointSize
    property double fontHeaderPointSize: Constants.fontHeaderPointSize

    onAccepted: {
        console.log("Exit high scores")
    }

    onReset: {
        GameData.cleanData()
        tableData = []
    }

    width: parent.width * 11 / 12
    height: parent.height * 10 / 12

    function showAndFocus() {
        visible = true
    }

    background: Rectangle {
        color: Constants.gold_bg_700
        border.color: Constants.gold_bg_900
    }

    header: Rectangle {
        id: headerTitle
        implicitWidth: parent.width * 11 / 12
        implicitHeight: parent.height * 2 / 12
        color: Constants.gold_bg_900
        Text {
            antialiasing: true
            color: Constants.gold_bg_text_100
            text: qsTr("High Scores")
            anchors.centerIn: parent
            font.pointSize: fontHeaderPointSize
        }
    }

    contentItem: Rectangle {
        id: dialogContent
        anchors {
            top: headerTitle.bottom
            left: headerTitle.left
        }
        color: Constants.gold_bg_300
        implicitWidth: parent.width * 11 / 12
        implicitHeight: parent.height * 6 / 12

        TableView {
            id: tableView
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 0
            model: TableModel {
                id: tableModel
                TableModelColumn {
                    display: "name"
                }
                TableModelColumn {
                    display: "score"
                }
                rows: tableData
            }

            delegate: Rectangle {
                id: recordDeligate
                color: Constants.gold_bg_300
                implicitWidth: dialogContent.width / 2
                implicitHeight: dialogContent.height / 10
                border.width: 1
                border.color: Constants.gold_bg_text_500
                Text {
                    id: textField
                    text: display
                    anchors.centerIn: parent
                    color: Constants.gold_bg_text_100
                    font.pointSize: fontPointSize
                }
            }
        }
    }

    footer: DialogButtonBox {
        id: footerButtons
        buttonLayout: DialogButtonBox.AndroidLayout
        implicitWidth: parent.width * 11 / 12
        implicitHeight: parent.height * 1 / 12
        Button {
            id: okButton
            text: qsTr("Ok")

            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole

            contentItem: Text {
                font.pointSize: fontPointSize
                text: okButton.text
                opacity: enabled ? 1.0 : 0.3
                color: okButton.down ? buttonTextColor : buttonTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: okButton.down ? buttonPressedColor : buttonColor
                border {
                    width: 2
                    color: Qt.darker(activePalette.button)
                }
                antialiasing: true
                radius: 20
            }
        }

        Button {
            id: resetButton
            text: qsTr("Reset")
            DialogButtonBox.buttonRole: DialogButtonBox.ResetRole

            contentItem: Text {
                font.pointSize: fontPointSize
                text: resetButton.text
                opacity: enabled ? 1.0 : 0.3
                color: resetButton.down ? buttonTextColor : buttonTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: resetButton.down ? buttonPressedColor : buttonColor
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
