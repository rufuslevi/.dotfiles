import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "root:/singletons"

PopupWindow {
    id: popup
    required property QtObject window
    required property PwNode node
    property real deltaX
    property bool condition

    anchor {
        adjustment: PopupAdjustment.SlideX
        rect {
            x: 2560 + deltaX - width / 2
            y: parentWindow.height
        }
    }
    anchor.window: window
    implicitWidth: 266
    implicitHeight: control.height + 16
    color: "transparent"

    Component.onCompleted: {
        visible = Qt.binding(function () {
            if (!node)
                return false;
            if (condition) {
                timer.start();
                return true;
            }
            if (mouse.hovered) {
                timer.stop();
                return true;
            }
            if (timer.running) {
                return true;
            }

            return false;
        });
    }

    Timer {
        id: timer
        interval: 250
        running: false
        repeat: false
    }

    HoverHandler {
        id: mouse
        onHoveredChanged: {
            console.log("CHANGED");
        }
    }

    Rectangle {
        anchors.fill: parent
        color: Config.addTransparency(Config.colors.base)
        bottomLeftRadius: Config.menuBar.radius
        bottomRightRadius: Config.menuBar.radius

        RowLayout {
            anchors.fill: parent
            StatusBarText {
                id: text
                text: popup.node.audio.muted ? "0%" : Math.round(popup.node.audio.volume * 100) + "%"
                Layout.alignment: Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.leftMargin: 8
                Layout.topMargin: 4
                color: "transparent"
                implicitWidth: 32
            }

            Slider {
                id: control

                from: 0.0
                to: 1.0
                stepSize: 0.05
                value: popup.node.audio.volume
                onValueChanged: popup.node.audio.volume = value
                implicitWidth: 200
                snapMode: Slider.SnapAlways

                Layout.topMargin: 4
                Layout.leftMargin: text.width - 24
                Layout.rightMargin: 8

                handle: Rectangle {
                    x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                    y: control.topPadding + control.availableHeight / 2 - height / 2 - 2.5

                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 8
                    color: Config.colors.text
                    border.color: "transparent"
                }
                background: Rectangle {
                    color: Config.colors.surface0
                    radius: 32
                    height: 10
                }
            }
        }
    }
}
