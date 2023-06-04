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

    readonly property color colorPrimary: "#009688"
    readonly property color colorAccent1: "#A7FFEB"
    readonly property color colorAccent2: "#64FFDA"
    readonly property color colorAccent3: "#1DE9B6"
    readonly property color colorAccent4: "#00BFA5"
    readonly property color colorBlack: "#000000"
    readonly property color colorWhite: "#FFFFFF"

    readonly property color color_50: "#E0F2F1"
    readonly property color color_100: "#B2DFDB"
    readonly property color color_200: "#80CBC4"
    readonly property color color_300: "#4DB6AC"
    readonly property color color_400: "#26A69A"
    readonly property color color_500: colorPrimary
    readonly property color color_600: "#00897B"
    readonly property color color_700: "#00796B"
    readonly property color color_800: "#00695C"
    readonly property color color_900: "#004D40"

    readonly property color gold_bg_100: "#FFDF00"
    readonly property color gold_bg_300: "#FFCC00"
    readonly property color gold_bg_500: "#ECBD00"
    readonly property color gold_bg_700: "#CC9900"
    readonly property color gold_bg_900: "#B8860B"

    readonly property color gold_bg_text_100: "#3E2723"
    readonly property color gold_bg_text_500: "#5C5346"
    readonly property color gold_bg_text_900: "#FFFFF0"

    readonly property double fontPointSize: 15
    readonly property double fontHeaderPointSize: 20
}
