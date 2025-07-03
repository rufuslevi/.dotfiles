import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import "root:/widgets"
import "root:/singletons"

Scope {
    // TopBar {}

    property int barHeight: 24

    Scope {
        // MenuBar
        PanelWindow {

            WlrLayershell.layer: WlrLayer.Top

            color: "transparent"
            implicitHeight: barHeight

            anchors {
                left: true
                top: true
                right: true
            }

            Rectangle {
                id: menuBar
                anchors.fill: parent
                implicitHeight: barHeight
                color: "transparent"
                z: 1

                ClockWidget {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            Rectangle {
                id: barBackground
                anchors.fill: parent
                implicitHeight: barHeight
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

        // Background
        PanelWindow {
            id: background

            WlrLayershell.layer: WlrLayer.Bottom

            anchors {
                left: true
                top: true
                right: true
                bottom: true
            }

            Rectangle {
                color: Config.colors.bar

                anchors {
                    fill: parent
                }

                Image {
                    id: img
                    source: "root:../backgrounds/dark_souls_bonfire_dark_souls_night_ruin_warrior_hd_games.jpg"
                    visible: false
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
                            anchors.topMargin: 24
                            topLeftRadius: 16
                            topRightRadius: 16
                        }
                        Rectangle {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            implicitHeight: 24
                        }
                    }
                }
            }
        }
    }
}
