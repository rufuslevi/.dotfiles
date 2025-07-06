import QtQuick
import "root:/singletons"

Rectangle {
    id: parent
    property string text

    width: content.contentWidth

    Text {
        id: content

        fontSizeMode: Text.Fit
        font.pixelSize: Config.text.size
        topPadding: 2
        font.family: Config.text.font
        color: Config.colors.text
        verticalAlignment: Text.AlignVCenter

        text: parent.text
    }
}
