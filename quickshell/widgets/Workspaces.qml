import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "root:/singletons"

RowLayout {
    id: indicators
    readonly property var workspaces: Hyprland.workspaces.values

    Repeater {
        model: indicators.workspaces
        delegate: Component {
            Rectangle {
                id: workspace
                required property var modelData
                width: workspace_number.contentWidth

                Text {
                    id: workspace_number
                    property HyprlandWorkspace data: workspace.modelData

                    fontSizeMode: Text.Fit
                    font.pixelSize: 15
                    topPadding: 2
                    verticalAlignment: Text.AlignVCenter

                    font {
                        family: Config.text.font
                    }

                    text: data.id + "~" + data.name
                    color: data.focused ? "white" : Config.colors.text
                }
            }
        }
    }
    Connections {
        target: Hyprland

        function onRawEvent(event: HyprlandEvent): void {
            if (event.name.endsWith("v2"))
                return;

            if (event.name.includes("mon"))
                Hyprland.refreshMonitors();
            else if (event.name.includes("workspace"))
                Hyprland.refreshWorkspaces();
            else
                Hyprland.refreshToplevels();
        }
    }
}
