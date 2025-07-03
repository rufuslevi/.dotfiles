import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "widgets"

Scope {
    PanelWindow {
        WlrLayershell.layer: WlrLayer.Top

        anchors {
            left: true
            top: true
            right: true
        }
        margins {
            bottom: 2
        }

        implicitHeight: 24

        ClockWidget {
            anchors {
                right: parent.right
            }
        }
    }

    PanelWindow {
        aboveWindows: false
        color: "white"

        implicitHeight: 32

        anchors {
            left: true
            top: true
            right: true
        }

        Rectangle {
            anchors.fill: parent
            radius: 12
            color: "blue"
        }
    }
}
