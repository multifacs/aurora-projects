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
                text: "Задание 7"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page7.qml"))
            }
            MenuItem {
                text: "Задание 8"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page8.qml"))
            }
        }

        anchors.fill: parent

        Column {
            anchors.centerIn: parent
            Slider {
                width: 500
                label: "Ползунок"
                minimumValue: -50
                maximumValue: 50
                value: 0
                stepSize: 1
                valueText: value
                onValueChanged: console.log(value)
                id: slider
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Значение: " + slider.value
            }
        }
    }
}
