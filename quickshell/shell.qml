import QtQuick
import Quickshell
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
                right: parent.right
            }

            AudioControls {
                window: statusBar
            }
        }
    }
}
