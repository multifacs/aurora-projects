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
            id: anim1
            running: true
            NumberAnimation { target: black; property: "y"; to: 500; duration: 1000; }
            NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; }
            onStopped: anim2.start()
        }

        ParallelAnimation {
            id: anim2
            running: false
            NumberAnimation { target: black; property: "y"; to: 300; duration: 1000; }
            NumberAnimation { target: black; property: "scale"; to: 1; duration: 1000; }
            onStopped: anim1.restart()
        }

        Label {
            id: label
            text: "Квадрат"
            color: "white"
            anchors.centerIn: parent
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl("Pages.qml"))
    }
}
