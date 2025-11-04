import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import qs.widgets
import qs.singletons

PanelWindow {
    id: menuBar
    default property alias content: bar.children

    WlrLayershell.layer: WlrLayer.Top

    color: "transparent"
    implicitHeight: Config.menuBar.height

    anchors {
        left: true
        top: true
        right: true
    }

    Rectangle {
        id: bar

        color: "transparent"
        z: 1

        anchors {
            fill: parent
            leftMargin: 4
            rightMargin: 4
            right: parent.right
            left: parent.left
        }
    }

    Rectangle {
        id: barBackground
        anchors.fill: parent
        color: Config.addTransparency(Config.colors.base)
    }
}
