import QtQuick
import QtQuick.Controls
import Quickshell.Services.Pipewire
import "root:/widgets"
import "root:/widgets/audio"
import "root:/singletons"

Button {
    id: mute_button
    required property PwNode node
    required property QtObject window

    visible: node != null | !node.ready
    implicitWidth: 32
    implicitHeight: 24
    hoverEnabled: true
    onClicked: {
        node.audio.muted = !node.audio.muted;
    }
    background: {}

    VolumeSlider {
        window: mute_button.window
        deltaX: mute_button.x - mute_button.width / 2
        node: mute_button.node
        condition: mute_button.hovered
    }

    StatusBarText {
        text: audio.node == null ? " 󰓄" : mute_button.node.audio.muted ? "  " : "  "
    }
}
