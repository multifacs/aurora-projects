import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Switch {
            id: mute
            icon.source: "image://theme/icon-m-speaker-mute?"
                         + (checked ? Theme.highlightColor
                                    : Theme.primaryColor)
        }
        Label {
            text: "The sound is " + (mute.checked ? "on" : "off")
        }

        Button {
            text: ">"
            onClicked: pageStack.push(Qt.resolvedUrl("Task9.qml"))
        }
        Button {
            text: "<"
            onClicked: pageStack.pop()
        }
    }
}
