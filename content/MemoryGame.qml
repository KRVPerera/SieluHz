import QtQuick 6.2
import SieluHz
import QtQuick.Layouts
import QtQuick.Controls 6.2
import "MemoryGame.js" as MemoryGame
import timeout 1.0
import QtQuick.LocalStorage
import gamedata

/**
  * This is taken from QML examples
  * QT - QML Advanced Tutorial 1,2,3,4
  */
Rectangle {
    id: gameScreen
    color: Constants.color_900
    anchors.fill: parent
    Layout.fillWidth: true

    SystemPalette {
        id: activePalette
    }

    Connections {
        target: Timeout

        onClockChanged: {
            var formattedNumber = String(Timeout.clock).padStart(4, ' ')
            timer.text = "Time : " + formattedNumber + "  "
        }

        onTickChanged: {
            MemoryGame.setTicks(Timeout.ticks)
            var scoreValue = MemoryGame.getScore()
            var formattedNumber = String(scoreValue).padStart(4, ' ')
            score.text = "  Score: " + formattedNumber + "  "
            if (MemoryGame.isWon()) {
                Timeout.stopAllTimers()
                 score.text = "  Winning Score: " + formattedNumber + "  "
                animationWon.start()
                MemoryGame.setWonColour(Constants.gold_bg_500)
                nameInputDialog.score = MemoryGame.getScore()
                nameInputDialog.showAndFocus()
            }
        }
    }

    ParallelAnimation {
        id: animationNew

        PropertyAction {
            target: gameScreen
            property: "color"
            value: Constants.color_900
        }

        PropertyAction {
            target: background
            property: "color"
            value: Constants.colorAccent2
        }

        PropertyAction {
            target: timer
            property: "color"
            value: Constants.colorWhite
        }

        PropertyAction {
            target: score
            property: "color"
            value: Constants.colorWhite
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonColor"
            value: Constants.color_600
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonColor"
            value: Constants.color_600
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonPressedColor"
            value: Constants.colorAccent2
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonPressedColor"
            value: Constants.colorAccent2
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonTextColor"
            value: Constants.colorWhite
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonTextColor"
            value: Constants.colorWhite
        }
    }

    ParallelAnimation {
        id: animationWon

        PropertyAction {
            target: gameScreen
            property: "color"
            value: Constants.gold_bg_900
        }

        PropertyAction {
            target: background
            property: "color"
            value: Constants.gold_bg_500
        }

        PropertyAction {
            target: timer
            property: "color"
            value: Constants.gold_bg_text_100
        }

        PropertyAction {
            target: score
            property: "color"
            value: Constants.gold_bg_text_100
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonColor"
            value: Constants.gold_bg_900
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonColor"
            value: Constants.gold_bg_900
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonPressedColor"
            value: Constants.gold_bg_100
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonPressedColor"
            value: Constants.gold_bg_100
        }

        PropertyAction {
            target: btnHighScores
            property: "buttonTextColor"
            value: Constants.gold_bg_text_100
        }

        PropertyAction {
            target: btnNewGame
            property: "buttonTextColor"
            value: Constants.gold_bg_text_100
        }
    }

    UserNameDialog {
        id: nameInputDialog
        anchors.centerIn: parent
        z: 100
    }

    HighscoreDialog {
        id: highscores
        anchors.centerIn: parent
        z: 200
    }

    ColumnLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        spacing: 0

        Rectangle {
            id: background
            color: Constants.colorAccent2
            height: 360
            Layout.fillWidth: true
            Layout.fillHeight: true
            property bool flipping: true

            onWidthChanged: {
                MemoryGame.redraw(background.width, background.height,
                                  background)
            }

            onHeightChanged: {
                MemoryGame.redraw(background.width, background.height)
            }
        }

        RowLayout {
            id: toolBar
            height: parent.height - background.height
            spacing: 0

            ButtonX {
                id: btnNewGame
                text: "New Game"
                onClicked: {
                    Timeout.clock = 0
                    Timeout.initClock()
                    Timeout.initTicks()
                    MemoryGame.startNewGame(background.width,
                                            background.height, background)
                    animationNew.start()
                    MemoryGame.setWonColour(Constants.colorAccent2)
                    GameData.openDatabase()
                }
            }

            Text {
                id: blank
                text: " "
                height: parent.height
                color: Constants.colorWhite
                antialiasing: true
                font.pixelSize: 25
            }

            ButtonX {
                id: btnHighScores
                text: "High Scores"
                onClicked: {
                    highscores.tableData = GameData.fetchData()
                    highscores.showAndFocus()
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                id: timer
                text: ""
                height: parent.height
                color: Constants.colorWhite
                antialiasing: true
                font.pixelSize: 25
                anchors.right: gameScreen.Right
            }

            Text {
                id: score
                text: "  Score: 0    "
                height: parent.height
                color: Constants.colorWhite
                antialiasing: true
                font.pixelSize: 25
                anchors.right: gameScreen.Right
            }
        } // RowLayout
    } // ColumnLayout
} // Rectangle
