import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        Button {
            property bool toggle: false
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Залипание"
            down: toggle
            onClicked: toggle = !toggle
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
                onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
            }
        }
    }
}
