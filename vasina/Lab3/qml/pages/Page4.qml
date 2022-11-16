import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Button {

        property int counter: 0

        id: btn
        y: 300
        anchors.horizontalCenter: parent.horizontalCenter

        text: "Счетчик"
        onClicked: counter++
    }
    Label {
        y: 400
        anchors.horizontalCenter: parent.horizontalCenter
        text: btn.counter
    }

    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
