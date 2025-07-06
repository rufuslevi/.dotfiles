import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "root:/widgets"
import "root:/widgets/audio"
import "root:/singletons"

Rectangle {
    id: audio
    required property QtObject window
    property PwNode node: Pipewire.defaultAudioSink
    property bool condition

    width: childrenRect.width

    PwObjectTracker {
        objects: [audio.node]
    }

    MuteButton {
        window: audio.window
        node: audio.node
        visible: audio.node != null
    }

    StatusBarText {
        text: "󰓄"
        visible: audio.node == null
    }
}
