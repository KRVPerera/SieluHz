import QtQuick 6.2
import "MemoryGame.js" as MemoryGame

/**
* <a href="https://www.flaticon.com/free-icons/construction-and-tools" title="construction and tools icons">Construction and tools icons created by surang - Flaticon</a>
*/

 Rectangle {
    id: block
    signal clicked
    border { width: 4; color: "#004D40" }
    radius: 10

    property bool isActive: false;
    property bool isSolved: false;
    // property int dataId: -1;
    property int newIndex: -1;
    property int imgId: -1;
    property string activeImage: "resources/pics/tile.png";

     onClicked: {
            if (isSolved) {
                return;
            }
            if (MemoryGame.handleClick(newIndex, imgId)) {
                isActive = !isActive;
            }
        }

     Image {
         id: img
         anchors.fill: parent
         source: {
             if (isSolved)
                return "resources/pics/square.png"
             else if (isActive)
                return activeImage
             else
                 return "resources/pics/frame.png"
         }
     }

     MouseArea{
            id: mouse
            anchors.fill:parent
            onClicked: block.clicked();
       }
 }
