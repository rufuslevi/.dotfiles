pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Colors colors: Colors {}

    component Colors: QtObject {
        readonly property color bar: "#24273a"
        readonly property color text: "#cad3f5"
    }
}
