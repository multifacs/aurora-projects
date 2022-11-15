import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Switch {
                anchors.horizontalCenter: parent.horizontalCenter
                id: mute
                icon.source: "image://theme/icon-m-speaker-mute?"
                             + (checked ? Theme.highlightColor
                                        : Theme.primaryColor)
            }
            Label {
                text: "The sound is " + (mute.checked ? "off" : "on")
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page9.qml"))
            }
        }
    }
}
