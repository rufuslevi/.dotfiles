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
            id: systemTray
            anchors {
                left: statusBar.left
            }

            SystemTray {}
        }

        StatusBarEntry {
            id: workspaces
            anchors {
                left: systemTray.right
            }
            Workspaces {
                anchors.leftMargin: 8
            }
        }

        StatusBarEntry {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            ClockWidget {}
        }

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
