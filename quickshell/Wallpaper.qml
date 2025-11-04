import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "singletons"

PanelWindow {
    id: background

    WlrLayershell.layer: WlrLayer.Bottom

    anchors {
        left: true
        top: true
        right: true
        bottom: true
    }

    Image {
        source: "root:../backgrounds/163_cropped.jpg"
        height: 1440.0
        width: 2560.0
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        color: Config.addTransparency(Config.colors.base)

        anchors {
            fill: parent
        }

        Image {
            id: img
            source: "root:../backgrounds/163_cropped.jpg"
            visible: false
            height: 1440.0
            width: 2560.0
            fillMode: Image.PreserveAspectCrop
        }

        MultiEffect {
            source: img
            anchors.fill: img
            maskEnabled: true
            maskSource: mask
        }

        Item {
            id: mask
            anchors {
                fill: parent
            }
            layer.enabled: true
            visible: false
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 0
                    topLeftRadius: Config.menuBar.radius
                    topRightRadius: Config.menuBar.radius
                    color: "white"
                }
            }
        }
    }
}
