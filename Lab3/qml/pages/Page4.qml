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
                text: "Задание 5"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            }
        }

        anchors.fill: parent

        Row {
            anchors.centerIn: parent
            spacing: 150

            Rectangle {
                width: 150
                height: 150
                color: "#000"
            }

            Rectangle {
                width: 150
                height: 150
                color: "#000"
                transform: [
                    Scale {
                        xScale: 0.5
                    },
                    Rotation {
                        angle: 45
                    }
                ]
            }
        }
    }
}
