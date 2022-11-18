import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Button {
        property int counter: 0
        anchors.centerIn: parent
        text: counter
        onClicked: counter++
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
