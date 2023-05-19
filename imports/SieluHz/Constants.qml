pragma Singleton
import QtQuick 6.2
//import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#c2c2c2"


//    property StudioApplication application: StudioApplication {
//        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
//    }


    readonly property color colorPrimary: "#673AB7"
    readonly property color colorAccent1: "#B388FF"
    readonly property color colorAccent2: "#7C4DFF"
    readonly property color colorAccent3: "#651FFF"
    readonly property color colorAccent4: "#6200EA"
    readonly property color colorBlack: "#000000"
    readonly property color colorWhite: "#FFFFFF"

    readonly property color color_50: "#EDE7F6"
    readonly property color color_100: "#D1C4E9"
    readonly property color color_200: "#B39DDB"
    readonly property color color_300: "#9575CD"
    readonly property color color_400: "#7E57C2"
    readonly property color color_500: colorPrimary
    readonly property color color_600: "#5E35B1"
    readonly property color color_700: "#512DA8"
    readonly property color color_800: "#4527A0"
    readonly property color color_900: "#311B92"

}
