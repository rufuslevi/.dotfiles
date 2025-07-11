pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import "root:/widgets"
import "root:/singletons"

Scope {
    Wallpaper {}
    StatusBar {
        id: statusBar

        StatusBarEntry {
            id: workspaces
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

        // StatusBarEntry {
        //     anchors {
        //         right: audioControls.left
        //     }
        //     Repeater {
        //         model: SystemTray.items.values
        //         delegate: MouseArea {
        //             id: tray
        //             required property var modelData
        //             property var item: modelData
        //
        //             Layout.alignment: Qt.AlignTop
        //             implicitWidth: 32
        //             implicitHeight: 24
        //
        //             acceptedButtons: Qt.LeftButton | Qt.RightButton
        //
        //             onClicked: event => {
        //                 console.log("clicked");
        //                 if (event.button === Qt.LeftButton)
        //                     modelData.activate();
        //                 else if (modelData.hasMenu)
        //                     menu.open();
        //             }
        //
        //             QsMenuAnchor {
        //                 id: menu
        //                 menu: tray.item.menu
        //                 anchor.window: parent.window
        //             }
        //
        //             IconImage {
        //                 Layout.fillHeight: true
        //                 implicitWidth: 24
        //                 implicitHeight: 24
        //
        //                 Component.onCompleted: {
        //                     console.log(tray.item.icon.split("?path=")[0]);
        //                 }
        //                 asynchronous: true
        //                 source: {
        //                     let icon = tray.item.icon;
        //                     if (icon.includes("?path=")) {
        //                         const [name, path] = icon.split("?path=");
        //                         icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
        //                     }
        //                     return icon;
        //                 }
        //             }
        //         }
        //     }
        // }
        //
        StatusBarEntry {
            id: audioControls

            anchors {
                right: parent.right
            }

            AudioControls {
                window: statusBar
            }
        }
    }
}
