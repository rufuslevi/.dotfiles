pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Colors colors: Colors {}
    readonly property MenuBar menuBar: MenuBar {}
    readonly property Text text: Text {}

    component Text: QtObject {
        readonly property string font: "MonaspiceAr NF"
        readonly property int size: 15
    }

    component Colors: QtObject {
        readonly property color text: "#cad3f5"
        readonly property color subtext1: "#b8c0e0"
        readonly property color subtext0: "#a5adcb"
        readonly property color surface0: "#363a4f"
        readonly property color base: "#24273a"
    }

    component MenuBar: QtObject {
        readonly property int height: 24
        readonly property int radius: 16
    }

    function addTransparency(color) {
        return Qt.rgba(color.r, color.g, color.b, 0.95);
    }
}
