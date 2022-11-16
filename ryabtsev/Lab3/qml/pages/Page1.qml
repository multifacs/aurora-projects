import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        PushUpMenu {
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
                text: "Задание 5"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            }
        }

        anchors.fill: parent

        Item {
            anchors.centerIn: parent
            width: 375
            height: 225

            Rectangle {
                id: red
                width: 150
                height: 150
                color: "#FF0000"
            }

            Rectangle {
                id: greed
                width: 150
                height: 150
                color: "green"
                anchors.top: red.verticalCenter
                anchors.left: red.right
            }

            Rectangle {
                id: blue
                width: 150
                height: 150
                color: "#0000FF"
                anchors.left: greed.horizontalCenter
                anchors.bottom: greed.verticalCenter
            }

            Text {
                text: "Квадрат"
                color: "#FFF"
                anchors.centerIn: blue
                font.pointSize: 20
            }
        }
    }
}
