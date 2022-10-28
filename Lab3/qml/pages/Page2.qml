import QtQuick 2.0
import Sailfish.Silica 1.0

Page {


    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        text: "Кнопка зажимается"
        onClicked: down = !down
    }

    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
