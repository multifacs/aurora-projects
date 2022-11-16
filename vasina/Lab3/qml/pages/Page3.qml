import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Button {
        y: 300
        id: btn
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Кнопка"
    }
    Label {
        y: 400
        anchors.horizontalCenter: parent.horizontalCenter
        text: btn.down ? "Нажато" : "Не нажато"
    }

    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}

