import QtQuick 6.2
import "MemoryGame.js" as MemoryGame


/**
* <a href="https://www.flaticon.com/free-icons/construction-and-tools" title="construction and tools icons">Construction and tools icons created by surang - Flaticon</a>
*/
Rectangle {
    id: block
    signal clicked
    border {
        width: 4
        color: "#004D40"
    }
    radius: 10
    antialiasing: true
    property bool isActive: false
    property bool isSolved: false
    property int newIndex: -1
    property int imgId: -1
    property string activeImage: "resources/pics/tile.png"
    readonly property string frameImage: "resources/pics/frame.png"
    readonly property string solvedImage: "resources/pics/square.png"

    onClicked: {
        if (block.state === 'SOLVED') {
            mouseArea.enabled = false;
            return
        }

        var initialState = block.state;


        if (MemoryGame.handleClick(newIndex, imgId)) {
            var newState = block.state;
            if (newState !== "SOLVED") {
                if (initialState === 'INIT') {
                    block.state = "ACTIVE";
                    animationActivate.start();
                } else if (initialState === "ACTIVE") {
                    block.state = "INIT";
                    animationDeactiavate.start();
                } else if (initialState === newState) {
                    animationFrameToActiveToFrame.start();
                }
            } else if (newState === "SOLVED") {
                animationSolve.start();
            }
        } else {
            var newState = block.state;
            if (newState!== "SOLVED" && initialState === newState) {
                animationFrameToActiveToFrame.start();
            }
        }

        console.log(block.state)
    }

    Image {
        id: img
        anchors.fill: parent
        source: "resources/pics/frame.png"
    }

    SequentialAnimation {
        id: animationSolve

        PropertyAction {
            target: img
            property: "source"
            value: block.activeImage
        }

        PauseAnimation { duration: 500 }

        PropertyAction {
            target: img
            property: "source"
            value: block.solvedImage
        }
    }

    SequentialAnimation {
        id: animationActivate

        PropertyAction {
            target: img
            property: "source"
            value: block.activeImage
        }
    }

    SequentialAnimation {
        id: animationDeactiavate

        PropertyAction {
            target: img
            property: "source"
            value: block.frameImage
        }
    }

    SequentialAnimation {
        id: animationFrameToActiveToFrame

        PropertyAction {
            target: img
            property: "source"
            value: block.activeImage
        }

        PauseAnimation { duration: 500 }

        PropertyAction {
            target: img
            property: "source"
            value: block.frameImage
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -5
        onClicked: block.clicked()
    }

    states: [
        State {
            name: "INIT"
            PropertyChanges {
                target: img
                source: block.frameImage
            }
        },
        State {
            name: "SOLVED"
            PropertyChanges {
                target: img
                source: block.solvedImage
            }
        },
        State {
            name: "ACTIVE"
            PropertyChanges {
                target: img
                source: block.activeImage
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: block
            property: "state"
            duration: 500
        }
    }

    state : "INIT"
}
