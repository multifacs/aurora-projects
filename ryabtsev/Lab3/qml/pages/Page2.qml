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

        Row {
            id: rectRow
            anchors.centerIn: parent
            width: red.width * 3 + rectRow.spacing * 2
            height: red.width * 2 + rectRow.spacing
            spacing: 5

            Column {
                spacing: 5

                Rectangle {
                    id: red
                    width: 170
                    height: width
                    color: "#FF0000"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#F0F"
                }
            }

            Column {
                spacing: 5

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "green"
                }
            }

            Column {
                spacing: 5

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#0000FF"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#000"
                }
            }
        }
    }

}
