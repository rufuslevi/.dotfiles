import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import "root:/widgets"
import "root:/singletons"

Scope {
    // TopBar {}

    Scope {
        // MenuBar
        PanelWindow {

            WlrLayershell.layer: WlrLayer.Top

            color: "transparent"
            implicitHeight: Config.menuBar.height

            anchors {
                left: true
                top: true
                right: true
            }

            Rectangle {
                id: menuBar
                anchors.fill: parent
                implicitHeight: Config.menuBar.height
                color: "transparent"
                z: 1
                anchors {
                    leftMargin: 4
                    rightMargin: 4
                }

                RowLayout {
                    id: indicators
                    readonly property var workspaces: Hyprland.workspaces.values

                    spacing: 10
                    anchors {
                        top: parent.top
                    }

                    Repeater {
                        model: indicators.workspaces
                        delegate: Component {
                            Rectangle {
                                id: workspace
                                required property var modelData
                                Layout.fillWidth: true
                                width: workspace_number.contentWidth

                                Text {
                                    id: workspace_number
                                    property HyprlandWorkspace data: workspace.modelData

                                    fontSizeMode: Text.Fit
                                    font.pixelSize: 15
                                    topPadding: 2
                                    verticalAlignment: Text.AlignVCenter

                                    font {
                                        family: Config.text.font
                                    }

                                    text: data.id + "~" + data.name
                                    color: data.focused ? "white" : Config.colors.text
                                }
                            }
                        }
                    }
                }

                ClockWidget {
                    anchors {
                        horizontalCenter: menuBar.horizontalCenter
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

    Connections {
        target: Hyprland

        function onRawEvent(event: HyprlandEvent): void {
            if (event.name.endsWith("v2"))
                return;

            if (event.name.includes("mon"))
                Hyprland.refreshMonitors();
            else if (event.name.includes("workspace"))
                Hyprland.refreshWorkspaces();
            else
                Hyprland.refreshToplevels();
        }
    }
    // FloatingWindow {
    //     // match the system theme background color
    //     color: contentItem.palette.active.window
    //
    //     ScrollView {
    //         anchors.fill: parent
    //         contentWidth: availableWidth
    //
    //         ColumnLayout {
    //             anchors.fill: parent
    //             anchors.margins: 10
    //
    //             // get a list of nodes that output to the default sink
    //             PwNodeLinkTracker {
    //                 id: linkTracker
    //                 node: Pipewire.defaultAudioSink
    //             }
    //
    //             MixerEntry {
    //                 node: Pipewire.defaultAudioSink
    //             }
    //
    //             Rectangle {
    //                 Layout.fillWidth: true
    //                 color: palette.active.text
    //                 implicitHeight: 1
    //             }
    //
    //             Repeater {
    //                 model: linkTracker.linkGroups
    //
    //                 MixerEntry {
    //                     required property PwLinkGroup modelData
    //                     // Each link group contains a source and a target.
    //                     // Since the target is the default sink, we want the source.
    //                     node: modelData.source
    //                 }
    //             }
    //         }
    //     }
    // }
}
