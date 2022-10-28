import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {

    TextField {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        placeholderText: "Только числа"
        inputMethodHints: Qt.ImhDigitsOnly
        description: "Ввод числа"
    }

    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 500
        text: Store.time
    }
}
