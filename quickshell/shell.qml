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

        StatusBarEntry {
            id: audioControls

            anchors {
                right: systemTray.left
            }

            AudioControls {
                window: statusBar
            }
        }
        StatusBarEntry {
            id: systemTray

            anchors {
                right: parent.right
            }

            SystemTray {}
        }
    }
}
