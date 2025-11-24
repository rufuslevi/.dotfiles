import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.widgets
import qs.singletons

PopupWindow {
    id: popup
    required property QtObject window
    required property PwNode node
    property real deltaX
    property bool opening_condition

    Popup {
        window: window
        deltaX: deltaX
        opening_condition: opening_condition
    }

    anchor {
        adjustment: PopupAdjustment.SlideX
        rect {
            x: 2560 + deltaX - width / 2
            y: parentWindow.height
        }
    }

    anchor.window: window
    color: "transparent"

    Component.onCompleted: {
        visible = Qt.binding(function () {
            if (!node)
                return false;
            if (opening_condition) {
                close_timer.start();
                return true;
            }
            if (mouse.hovered) {
                close_timer.start();
                return true;
            }
            if (close_timer.running) {
                return true;
            }

            return false;
        });
    }

    Timer {
        id: close_timer
        interval: 1000
        running: false
        repeat: false
    }

    HoverHandler {
        id: mouse
    }
}
