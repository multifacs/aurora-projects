import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Rectangle {
        id: black
        width: 150
        height: width
        color: "#000"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300

        ParallelAnimation {
            running: true
            NumberAnimation { target: black; property: "y"; to: 500; duration: 1000; loops: Animation.Infinite }
            NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; loops: Animation.Infinite }
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl("Pages.qml"))
    }
}
