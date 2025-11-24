import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import qs.widgets
import qs.widgets.audio
import qs.singletons

Rectangle {
    id: audio
    required property QtObject window
    property PwNode node: Pipewire.defaultAudioSink == null ? null : Pipewire.defaultAudioSink.name == "auto_null" ? null : Pipewire.defaultAudioSink
    property bool condition

    implicitWidth: 100

    PwObjectTracker {
        objects: [audio.node]
    }

    Players {
        window: audio.window
        node: audio.node
        mute: mute

        implicitWidth: 324
    }

    CustomPopup {
        id: mute
        anchors {
            right: audio.right
        }

        window: audio.window
        node: audio.node
        popupSize: Qt.rect(0, 0, 328, 200)
        popupContent: Sliders {
            id: sliders
            node: audio.node
        }

        onClicked: {
            node == null ? null : node.audio.muted = !node.audio.muted;
        }

        StatusBarText {
            text: audio.node == null ? " 󰓄" : mute.node == null ? "  " : mute.node.audio.muted ? "  " : "  "
        }
    }
}
