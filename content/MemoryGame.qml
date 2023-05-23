import QtQuick 6.2
//import SieluHz
import QtQuick.Layouts
import QtQuick.Controls 6.2
import "MemoryGame.js" as MemoryGame

/**
  * This is taken from QML examples
  * QT - QML Advanced Tutorial 1,2,3,4
  */
Rectangle {
    id: gameScreen
    color: "#004D40"
    anchors.fill: parent
    Layout.fillWidth: true

    SystemPalette { id: activePalette }

    Timeout {
        id : gameTimer
    }

    ColumnLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        spacing: 0

        Rectangle {
            id: background
            color: "#64FFDA"
            height: 360
            Layout.fillWidth: true
            Layout.fillHeight: true
            // anchors.margins: 0
            // anchors.centerIn: parent
            property bool flipping: true;

            onWidthChanged: {
                MemoryGame.redraw(background.width, background.height, background)
            }

            onHeightChanged: {
                MemoryGame.redraw(background.width, background.height)
            }
        }

        // Item {
        //     id: gameCanvas

        //     property int score: 0
        //     property int blockSize: 40

        //     width: parent.width - (parent.width % blockSize)
        //     height: parent.height - (parent.height % blockSize)
        //     anchors.centerIn: parent

        //     MouseArea {
        //         anchors.fill: parent
        //         onClicked: (mouse)=> SameGame.handleClick(mouse.x, mouse.y)
        //     }
        // }

        RowLayout {
            id: toolBar
            height: parent.height - background.height
            spacing: 0

            ButtonX {
                id: btnNewGame
                text: "New Game"
                onClicked: MemoryGame.startNewGame(background.width, background.height, background)
            }

            ButtonX {
                id: btnHighScores
                text: "High Scores"
                onClicked: console.log("This is blank")
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                id: timer
                text: "time : 0    "
                height: parent.height
                color: "#FFFFFF"
                antialiasing: true
                font.pixelSize: 25
                anchors.right: gameScreen.Right
             }

            Text {
                id: score
                text: "Score: 0    "
                height: parent.height
                color: "#FFFFFF"
                antialiasing: true
                font.pixelSize: 25
                anchors.right: gameScreen.Right
             }
        }  // RowLayout
    }  // ColumnLayout
}  // Rectangle
