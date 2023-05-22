import QtQuick 6.2

/**
* <a href="https://www.flaticon.com/free-icons/construction-and-tools" title="construction and tools icons">Construction and tools icons created by surang - Flaticon</a>
*/

 Rectangle {
    id: block
    signal clicked
    border { width: 4; color: "#004D40" }
    radius: 20

    property bool isActive: false;
    property bool isSolved: false;
    property int dataId: -1;
    property int imgId: -1;
    property string activeImage: "resources/pics/im1.png";

     onClicked: {
             isActive = !isActive;
             console.log("Cliked imgId : ", imgId, " ID: ", dataId)
         }

     Image {
         id: img
         anchors.fill: parent
         source: {
             if (isActive)
                 return activeImage
             else if (isSolved)
                 return "resources/pics/square.png"
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
