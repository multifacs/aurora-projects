import QtQuick 2.0
import Sailfish.Silica 1.0
import "../."

CoverBackground {
    objectName: "defaultCover"

    property int counter: 0

    Label {
        id: label123
        anchors.centerIn: parent
        text: task1
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-splus-add"
            onTriggered: counter++
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-remove"
            onTriggered: counter--
        }
    }
}
