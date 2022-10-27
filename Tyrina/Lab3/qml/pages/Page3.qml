import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 100

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                id: btn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Нажать!"
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: btn.down ? "Нажато" : "Не нажато"
            }
        }
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 10
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        }
    }
}

