import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "root:/widgets"
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
    implicitWidth: 324
    implicitHeight: (control.height + 16) * (1 + link.linkGroups.length)
    color: "transparent"

    PwNodeLinkTracker {
        id: link
        node: popup.node
    }

    Component.onCompleted: {
        visible = Qt.binding(function () {
            if (!node)
                return false;
            if (condition) {
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

    Rectangle {
        anchors.fill: parent
        color: Config.addTransparency(Config.colors.base)
        bottomLeftRadius: Config.menuBar.radius
        bottomRightRadius: Config.menuBar.radius

        ColumnLayout {
            anchors.fill: parent

            RowLayout {
                Layout.alignment: Qt.AlignTop
                implicitHeight: 32
                StatusBarText {
                    id: input_name
                    text: "system"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.leftMargin: 16 + (48 - childrenRect.width) / 2
                    Layout.rightMargin: (48 - childrenRect.width) / 2
                    Layout.topMargin: 4
                    color: "transparent"
                }

                StatusBarText {
                    id: text
                    text: popup.node.audio.muted ? " " : Math.round(popup.node.audio.volume * 100) + "%"
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
                    implicitWidth: 192
                    snapMode: Slider.SnapAlways

                    Layout.topMargin: 4
                    Layout.leftMargin: text.width - 24
                    Layout.rightMargin: 8
                    Layout.alignment: Qt.AlignVCenter

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

            RowLayout {
                id: balanceRow
                property real balance: 0

                Layout.alignment: Qt.AlignTop
                implicitHeight: 32

                StatusBarText {
                    text: "balance"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.leftMargin: 16 + (48 - childrenRect.width) / 2
                    Layout.rightMargin: (48 - childrenRect.width) / 2
                    Layout.topMargin: 4
                    color: "transparent"
                }

                StatusBarText {
                    text: Math.round(100 * balanceRow.balance) + "%"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.leftMargin: 8
                    Layout.topMargin: 4
                    color: "transparent"
                    implicitWidth: 32
                }

                Slider {
                    id: balanceSlider

                    from: -1.0
                    to: 1.0
                    stepSize: 0.05
                    value: balanceRow.balance
                    onValueChanged: {
                        balanceRow.balance = value;
                        if (balanceRow.balance == 0) {
                            popup.node.audio.volumes[0] = popup.node.audio.volume;
                            popup.node.audio.volumes[1] = popup.node.audio.volume;
                            return;
                        }

                        popup.node.audio.volumes[0] = Math.max(0, Math.min(1, popup.node.audio.volume - balanceRow.balance));
                        popup.node.audio.volumes[1] = Math.max(0, Math.min(1, popup.node.audio.volume + balanceRow.balance));
                    }
                    implicitWidth: 192
                    snapMode: Slider.SnapAlways

                    Layout.topMargin: 4
                    Layout.leftMargin: text.width - 24
                    Layout.rightMargin: 8
                    Layout.alignment: Qt.AlignVCenter

                    handle: Rectangle {
                        x: balanceSlider.leftPadding + balanceSlider.visualPosition * (balanceSlider.availableWidth - width)
                        y: balanceSlider.topPadding + balanceSlider.availableHeight / 2 - height / 2 - 2.5

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

            Repeater {
                model: link.linkGroups
                delegate: RowLayout {
                    id: row
                    required property var modelData
                    property PwNode node: modelData.source

                    Layout.alignment: Qt.AlignTop
                    implicitHeight: 32

                    PwObjectTracker {
                        objects: [row.node]
                    }

                    StatusBarText {
                        id: row_input_name
                        text: row.node.name.substring(0, 6)
                        Layout.alignment: Qt.AlignVCenter
                        Layout.fillHeight: true
                        Layout.leftMargin: 16 + (48 - childrenRect.width) / 2
                        Layout.rightMargin: (48 - childrenRect.width) / 2
                        Layout.topMargin: 4
                        color: "transparent"
                        AbstractButton {
                            anchors.fill: parent
                            onClicked: {
                                row.node.audio.muted = !row.node.audio.muted;
                            }
                        }
                    }

                    StatusBarText {
                        id: rowText
                        text: popup.node.audio.muted || row.node.audio.muted ? "  " : Math.round(row.node.audio.volume * 100) + "%"
                        Layout.alignment: Qt.AlignVCenter
                        Layout.fillHeight: true
                        Layout.leftMargin: 8
                        Layout.topMargin: 4
                        color: "transparent"
                        implicitWidth: 32

                        AbstractButton {
                            anchors.fill: parent
                            onClicked: {
                                row.node.audio.muted = !row.node.audio.muted;
                            }
                        }
                    }

                    Slider {
                        id: rowControl

                        from: 0.0
                        to: 1.0
                        stepSize: 0.05
                        value: row.node.audio.volume
                        onValueChanged: row.node.audio.volume = value
                        implicitWidth: 192
                        snapMode: Slider.SnapAlways

                        Layout.topMargin: 4
                        Layout.leftMargin: rowText.width - 24
                        Layout.rightMargin: 8
                        Layout.alignment: Qt.AlignVCenter

                        handle: Rectangle {
                            x: rowControl.leftPadding + rowControl.visualPosition * (rowControl.availableWidth - width)
                            y: rowControl.topPadding + rowControl.availableHeight / 2 - height / 2 - 2.5

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
    }
}
