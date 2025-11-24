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
    id: players
    required property QtObject window
    required property PwNode node
    required property CustomPopup mute

    anchors {
        right: mute.left
        rightMargin: 12
    }
    implicitWidth: 100
    color: "blue"

    // CustomPopup {
    //     window: players.window
    //     node: players.node
    //     popupSize: Qt.rect(0, 0, 328, 200)
    //     popupContent: ColumnLayout {
    //         anchors.fill: parent
    //         Repeater {
    //             model: Mpris.players
    //             delegate: Player {
    //                 required property var modelData
    //                 player: modelData
    //             }
    //         }
    //     }

    Player {
        player: Mpris.players.values[1]
        // Component.onCompleted: {
        //     player = Qt.binding(function () {
        //         var display = player;
        //         Mpris.players.values.forEach(player => {
        //             if (player.isPlaying) {
        //                 display = player;
        //             }
        //         });
        //         return display;
        //     });
        // }
    }
}
