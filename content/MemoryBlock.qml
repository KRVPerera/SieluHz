import QtQuick 6.2

/**
* <a href="https://www.flaticon.com/free-icons/construction-and-tools" title="construction and tools icons">Construction and tools icons created by surang - Flaticon</a>
*/

 Rectangle {
     id: block
     signal clicked
     border { width: 4; color: "#004D40" }
//     radius: 20
     width: 200
     height: 200

     property bool isActive: false;

     onClicked: {
             isActive = !isActive;
         }

     Image {
         id: img
         anchors.fill: parent
         source: {
             if (isActive)
                 return "resources/pics/im1.png"
             else
                 return "resources/pics/tile.png"
         }
     }

     MouseArea{
            id: mouse
            anchors.fill:parent
            onClicked: block.clicked();
       }
 }
