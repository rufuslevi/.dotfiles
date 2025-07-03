import QtQuick
import QtQuick.Layouts
import "../singletons"

RowLayout {
    Text {
        fontSizeMode: Text.Fit

        text: Time.time
    }
}
