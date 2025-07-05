import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import "root:/widgets"
import "root:/singletons"

Scope {
    Scope {
        Wallpaper {}
        StatusBar {
            StatusBarEntry {
                anchors {
                    left: parent.left
                }
                Workspaces {}
            }

            StatusBarEntry {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                ClockWidget {}
            }

            StatusBarEntry {
                anchors {
                    right: parent.right
                }
                StatusBarText {
                    text: "󰓃"
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
