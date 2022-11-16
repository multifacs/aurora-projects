import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent

        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            id: mute
            icon.source: "image://theme/icon-m-speaker-mute?"
                         + (checked ? Theme.highlightColor
                                    : Theme.primaryColor)
        }
        Label {
            text: "Звук " + (mute.checked ? "включен" : "выключен")
        }
    }

    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page9.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
