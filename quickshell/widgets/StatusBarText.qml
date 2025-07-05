import QtQuick
import "root:/singletons"

Rectangle {
    id: parent
    property string text

    width: content.contentWidth
    anchors {}

    Text {
        id: content

        fontSizeMode: Text.Fit
        font.pixelSize: Config.text.size
        topPadding: 2
        font.family: Config.text.family
        color: Config.colors.text
        verticalAlignment: Text.AlignVCenter

        text: parent.text
    }
}
