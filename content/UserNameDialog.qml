import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import SieluHz
import gamedata

Dialog {
    id: userNameDialog
    modal: true
    visible: false
    title: "You Won!"

    property string inputText: textInput.text
    property int score: 0
    property color buttonTextColor: Constants.gold_bg_text_100
    property color buttonColor: Constants.gold_bg_900
    property color buttonPressedColor: Constants.gold_bg_100

    onAccepted: {
        console.log("Saving the score : ", String(score).padStart(4, ' '))
        GameData.addData(inputText, score)
        highscores.tableData = GameData.fetchData()
        highscores.showAndFocus()
        reset()
    }

    onRejected: {
        console.log("Cancel clicked")
        reset()
    }

    width: Math.max(userNameQuestion.width, textInput.width) + 100

    function showAndFocus() {
        visible = true
        textInput.focus = true
    }

    function reset() {
        score = 0
        textInput.text = ""
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
            text: qsTr("Congratulations !")
            anchors.centerIn: parent
        }
    }

    contentItem: Rectangle {
        id: dialogContent
        implicitWidth: 400
        implicitHeight: 80
        anchors.fill: parent
        color: Constants.gold_bg_700

        Text {
            id: userNameQuestion
            antialiasing: true
            color: Constants.gold_bg_text_100
            text: qsTr("What is your name?")
            anchors.centerIn: parent
        }

        TextInput {
            id: textInput
            color: Constants.gold_bg_text_100
            anchors {
                left: userNameQuestion.left
                top: userNameQuestion.bottom
            }
            text: ""
            cursorVisible: true
            font.capitalization: Font.SmallCaps
            onAccepted: userNameDialog.accept()
        }
    }

    footer: DialogButtonBox {
        id: footerButtons
        buttonLayout: DialogButtonBox.AndroidLayout
        Button {
            id: saveButton
            text: qsTr("Save")
            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole

            contentItem: Text {
                text: saveButton.text
                font: saveButton.font
                opacity: enabled ? 1.0 : 0.3
                color: saveButton.down ? buttonTextColor : buttonTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
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
        Button {
            id: closeButton
            text: qsTr("Close")
            DialogButtonBox.buttonRole: DialogButtonBox.RejectRole

            contentItem: Text {
                text: closeButton.text
                font: closeButton.font
                opacity: enabled ? 1.0 : 0.3
                color: closeButton.down ? buttonTextColor : buttonTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: closeButton.down ? buttonPressedColor : buttonColor
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
