import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "root:/widgets"

Scope {
    // TopBar {}

    property string barColor: "white"
    property int barHeight: 24

    Scope {
        // MenuBar
        PanelWindow {
            id: menuBar

            WlrLayershell.layer: WlrLayer.Top

            implicitHeight: barHeight
            anchors {
                left: true
                top: true
                right: true
            }

            color: barColor

            ClockWidget {
                anchors {
                    right: parent.right
                }
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
                anchors {
                    topMargin: barHeight
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
                    anchors.fill: img
                    layer.enabled: true
                    visible: false
                    Rectangle {
                        anchors.fill: parent
                        topLeftRadius: 16
                        topRightRadius: 16
                    }
                }
            }
        }
    }
}
