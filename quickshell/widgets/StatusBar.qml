import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "root:/widgets"
import "root:/singletons"

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
        color: Qt.rgba(Config.colors.bar.r, Config.colors.bar.g, Config.colors.bar.b, 0.9)
    }
    MultiEffect {
        source: barBackground
        anchors.fill: barBackground
        autoPaddingEnabled: true
        blurEnabled: true
        blur: 1.0
    }
}
