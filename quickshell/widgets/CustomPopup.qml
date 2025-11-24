import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.widgets
import qs.widgets.audio
import qs.singletons

Button {
    id: popup_button
    required property QtObject window
    required property PwNode node
    property real deltaX
    property QtObject popupContent
    property rect popupSize

    visible: node != null | !node.ready
    implicitWidth: 32
    implicitHeight: 24
    hoverEnabled: true
    background: null

    PopupWindow {
        id: popup
        anchor {
            window: popup_button.window
            adjustment: PopupAdjustment.SlideX
            rect {
                x: 2560 - popupSize.width
                y: 24
            }
        }
        implicitWidth: popupSize.width
        implicitHeight: popupSize.height

        data: Rectangle {
            color: "transparent"
            children: popup_button.popupContent
        }
        color: "transparent"

        Component.onCompleted: {
            visible = Qt.binding(function () {
                if (!node)
                    return false;
                if (popup_button.hovered) {
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
}
