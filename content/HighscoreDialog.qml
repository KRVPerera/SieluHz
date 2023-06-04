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

    onAccepted: {
        console.log("Exit high scores")
    }

    onReset: {
        GameData.cleanData()
    }

    width: 420
    height: 500

    function showAndFocus() {
        visible = true
    }

    background: Rectangle {
        color: Constants.gold_bg_700
        border.color: Constants.gold_bg_900
    }

    header: Rectangle {
        id: headerTitle
        implicitWidth: 400
        implicitHeight: 50
        color: Constants.gold_bg_900
        Text {
            antialiasing: true
            color: Constants.gold_bg_text_100
            text: qsTr("High Scores")
            anchors.centerIn: parent
        }
    }

    contentItem: Rectangle {
        id: dialogContent
        anchors.centerIn: parent
        color: Constants.gold_bg_300

        TableView {
            id: tableView
            anchors.fill: parent
            columnSpacing: 0
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
                implicitWidth: Math.max(100, textField.width) + 30
                implicitHeight: 25
                border.width: 1
                border.color: Constants.gold_bg_text_500
                Text {
                    id: textField
                    text: display
                    anchors.centerIn: parent
                    color: Constants.gold_bg_text_100
                }
            }
        }
    }

    footer: DialogButtonBox {
        id: footerButtons
        buttonLayout: DialogButtonBox.AndroidLayout
        Button {
            id: okButton
            text: qsTr("Ok")

            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole

            contentItem: Text {
                text: okButton.text
                font: okButton.font
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
                text: resetButton.text
                font: resetButton.font
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
