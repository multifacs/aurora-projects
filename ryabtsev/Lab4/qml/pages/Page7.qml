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
                text: "Задание 5"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            }
            MenuItem {
                text: "Задание 8"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page8.qml"))
            }
            MenuItem {
                text: "Задание 9"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page9.qml"))
            }
        }

        anchors.fill: parent

        ComboBox {
            anchors.centerIn: parent
            label: "Выпадающий список"
            description: "Описание выпадающего списка"
            menu: ContextMenu {
                MenuItem { text: "первый" }
                MenuItem { text: "второй" }
                MenuItem { text: "третий" }
            }
            onCurrentIndexChanged: console.log(value)
        }
    }
}
