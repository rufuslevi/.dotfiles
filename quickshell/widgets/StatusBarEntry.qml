import QtQuick
import QtQuick.Layouts
import "root:/singletons"

Rectangle {
    id: parent

    default property alias content: row.children

    width: childrenRect.width

    anchors {
        topMargin: 2
        leftMargin: 8
        rightMargin: 8
    }

    RowLayout {
        id: row
    }
}
