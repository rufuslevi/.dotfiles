import QtQuick
import qs.singletons

Rectangle {
    id: parent
    property string text

    implicitWidth: content.contentWidth
    implicitHeight: Config.bar.height
    color: "transparent"

    anchors {
        leftMargin: (parent.width - implicitWidth) / 2
        rightMargin: (parent.width - implicitWidth) / 2
    }

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
