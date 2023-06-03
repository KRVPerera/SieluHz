import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import SieluHz
import gamedata

Dialog {
    id: container
    modal: true
    visible: false

    standardButtons: DialogButtonBox.Ok


    onAccepted: {
        console.log("Saving the score")
        GameData.fetchData()
    }

//    width: Math.max(userNameQuestion.width, textInput.width) + 100

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
    }
}
