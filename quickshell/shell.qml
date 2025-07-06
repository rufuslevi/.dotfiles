import QtQuick
import Quickshell
import "root:/widgets"
import "root:/singletons"

Scope {
    Wallpaper {}
    StatusBar {
        id: statusBar

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

            AudioControls {
                window: statusBar
            }
        }
    }
}
