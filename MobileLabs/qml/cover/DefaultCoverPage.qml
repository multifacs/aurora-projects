import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    property int counter: 0

    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("Счётчик: %1").arg(counter)
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
