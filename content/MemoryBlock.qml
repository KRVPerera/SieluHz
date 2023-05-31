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

    property bool isActive: false
    property bool isSolved: false
    property int newIndex: -1
    property int imgId: -1
    property string activeImage: "resources/pics/tile.png"

    onClicked: {
        if (block.state === 'SOLVED') {
            return
        }

        if (MemoryGame.handleClick(newIndex, imgId)) {
            if (block.state === '') {
                block.state = "ACTIVE"
            } else if (block.state === 'ACTIVE') {
                block.state = "INIT"
            } else if (block.state === 'INIT') {
                block.state = "ACTIVE"
            }
        }
        console.log(block.state)
    }

    Image {
        id: img
        anchors.fill: parent
        source: "resources/pics/frame.png"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        anchors.margins: -5
        onClicked: block.clicked()
    }

    states: [
        State {
            name: "INIT"
            PropertyChanges {
                target: img
                source: "resources/pics/frame.png"
            }
        },
        State {
            name: "SOLVED"
            PropertyChanges {
                target: img
                source: "resources/pics/square.png"
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
}
