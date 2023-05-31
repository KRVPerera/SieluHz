import QtQuick
import SieluHz

Rectangle {
    id: container

    property string text: "Button"

    signal clicked

    width: buttonLabel.width + 20; height: buttonLabel.height + 10
    border { width: 2; color: Qt.darker(activePalette.button) }
    antialiasing: true
    radius: 20
    property color buttonTextColor: Constants.colorWhite
    property color buttonColor: Constants.color_600
    property color buttonPressedColor: Constants.colorAccent2

    color: {
                if (mouseArea.pressed)
                    return buttonPressedColor
                else
                    return buttonColor
            }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked();
    }

    Text {
        id: buttonLabel
        anchors.centerIn: container
        color: {
                if (mouseArea.pressed)
                    return Constants.colorBlack
                else
                    return buttonTextColor
            }
        text: container.text
    }
}
