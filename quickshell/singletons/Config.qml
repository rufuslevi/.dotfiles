pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Colors colors: Colors {}
    readonly property MenuBar menuBar: MenuBar {}
    readonly property Text text: Text {}

    component Text: QtObject {
        readonly property string family: "MonaspiceAr NF"
        readonly property int size: 15
    }

    component Colors: QtObject {
        readonly property color bar: "#24273a"
        readonly property color text: "#cad3f5"
    }
    component MenuBar: QtObject {
        readonly property int height: 24
    }
}
