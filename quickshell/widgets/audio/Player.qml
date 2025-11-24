import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import qs.widgets
import qs.widgets.audio
import qs.singletons

RowLayout {
    id: player_handle
    required property var player

    Layout.alignment: Qt.AlignTop
    Layout.fillHeight: true

    StatusBarText {
        id: name
        text: {
            var identifier = "";
            print(player_handle.player.trackArtist)
            if (player_handle.player == null)
                return identifier;
            if (player_handle.player.trackArtist.length > 6)
                identifier += player_handle.player.trackArtist.substring(0, 6) + "...";
            else
                identifier += player_handle.player.trackArtist;

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
        color: player_handle.player == null ? "" : player_handle.player.canGoPrevious ? "" : Config.colors.overlay0

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
        color: player_handle.player == null ? "" : player_handle.player.canPlay ? "" : Config.colors.overlay0

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
        color: player_handle.player == null ? "" : player_handle.player.canGoNext ? "" : "black"

        AbstractButton {
            implicitHeight: 24
            implicitWidth: 24
            onClicked: {
                player_handle.player.next();
            }
        }
    }
}
