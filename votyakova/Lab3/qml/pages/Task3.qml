import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Button {
            id: btn
            text: "Нажать!"
        }
        Label {
            text: btn.down ? "Нажато" : "Не нажато"
        }

        Button {
            text: ">"
            onClicked: pageStack.push(Qt.resolvedUrl("Task4.qml"))
        }
        Button {
            text: "<"
            onClicked: pageStack.pop()
        }
    }
}

