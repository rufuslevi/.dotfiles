import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import "root:/widgets"
import "root:/widgets/audio"
import "root:/singletons"

Rectangle {
    id: audio
    required property QtObject window
    property PwNode node: Pipewire.defaultAudioSink.name == "auto_null" ? null : Pipewire.defaultAudioSink
    property bool condition

    implicitWidth: childrenRect.width

    PwObjectTracker {
        objects: [audio.node]
    }

    Rectangle {
        anchors {
            right: mute.left
            rightMargin: 12
        }
        width: childrenRect.width

        Repeater {
            model: Mpris.players
            delegate: RowLayout {
                id: player_handle
                required property var modelData
                property var player: modelData

                Layout.alignment: Qt.AlignTop
                implicitWidth: 2 * 32
                Layout.fillHeight: true

                StatusBarText {
                    id: name
                    text: {
                        console.log(player_handle.player.canPlay);
                        var identifier = "";
                        if (player_handle.player.desktopEntry.length > 6)
                            identifier += player_handle.player.desktopEntry.substring(0, 6) + "...";
                        else
                            identifier += player_handle.player.desktopEntry;

                        identifier += " : ";

                        if (player_handle.player.trackTitle.length > 12)
                            identifier += player_handle.player.trackTitle.substring(0, 12) + "...";
                        else
                            identifier += player_handle.player.trackTitle;

                        return identifier;
                    }
                }

                StatusBarText {
                    id: previous
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true

                    text: " 󰒮"
                    color: player_handle.player.canGoPrevious ? "" : Config.colors.overlay0

                    AbstractButton {
                        implicitHeight: 24
                        implicitWidth: 24
                        onClicked: {
                            player_handle.player.previous();
                        }
                    }
                }

                StatusBarText {
                    id: play_pause
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    text: " 󰐎"
                    color: player_handle.player.canPlay ? "" : Config.colors.overlay0

                    AbstractButton {
                        implicitHeight: 24
                        implicitWidth: 24
                        onClicked: {
                            player_handle.player.togglePlaying();
                        }
                    }
                }

                StatusBarText {
                    id: next
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true

                    text: " 󰒭"
                    color: player_handle.player.canGoNext ? "" : "black"

                    AbstractButton {
                        implicitHeight: 24
                        implicitWidth: 24
                        onClicked: {
                            player_handle.player.next();
                        }
                    }
                }
            }
        }
    }

    MuteButton {
        id: mute
        anchors {
            right: audio.right
        }
        window: audio.window
        node: audio.node
    }
}
