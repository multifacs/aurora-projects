import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        PushUpMenu {
            MenuItem {
                text: "Задание 1"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page1.qml"))
            }
            MenuItem {
                text: "Задание 2"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page2.qml"))
            }
            MenuItem {
                text: "Задание 3"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page3.qml"))
            }
            MenuItem {
                text: "Задание 4"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page4.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            }
        }

        anchors.fill: parent

        Rectangle {
            id: black
            width: 150
            height: 150
            y: 300
            color: "#000"
            anchors.horizontalCenter: parent.horizontalCenter

            ParallelAnimation {
                running: true
                NumberAnimation { target: black; property: "y"; to: 600; duration: 1000; loops: Animation.Infinite }
                NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; loops: Animation.Infinite }
            }
        }
    }
}
