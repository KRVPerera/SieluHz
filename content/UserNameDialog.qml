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

    onAccepted: {
        console.log("Saving the score : ", String(score).padStart(4, ' '))
        GameData.addData(inputText, score)
        reset();
    }

    onRejected: {
        console.log("Cancel clicked")
        reset();
    }

    width: Math.max(userNameQuestion.width, textInput.width) + 100

    function showAndFocus() {
        visible = true
        textInput.focus = true
    }

    function reset() {
        score = 0;
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
            text: qsTr("Save")
            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
        }
        Button {
            text: qsTr("Close")
            DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
        }
    }
}
