import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import qs.widgets
import qs.singletons

RowLayout {
    anchors.rightMargin: 4
    Repeater {
        model: SystemTray.items.values
        delegate: MouseArea {
            id: tray
            required property var modelData
            property var item: modelData

            Layout.alignment: Qt.AlignTop
            Layout.rightMargin: 2

            implicitHeight: 24

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: event => {
                if (event.button === Qt.LeftButton)
                    modelData.activate();
                else if (modelData.hasMenu)
                    menu.open();
            }

            QsMenuAnchor {
                id: menu
                menu: tray.item.menu
                anchor.window: parent.window
            }

            StatusBarText {
                implicitHeight: 24

                text: {
                    if (tray.item.title == "Solaar")
                        return " 󰍽";
                    if (tray.item.title == "gammastep-indicator")
                        return " 󰃝";
                    return icon;
                }
            }
        }
    }
    Rectangle {
        implicitWidth: 16
    }
}
