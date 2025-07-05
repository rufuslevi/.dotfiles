import QtQuick
import QtQuick.Layouts
import "root:/singletons"

Text {
    fontSizeMode: Text.Fit
    font.pixelSize: 15
    topPadding: 2
    font.family: Config.text.font
    color: Config.colors.text
    verticalAlignment: Text.AlignVCenter

    text: Time.time
}
