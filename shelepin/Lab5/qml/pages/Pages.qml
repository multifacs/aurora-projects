import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Grid {
        columns: 2
        property int btnWidth: 250
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Задание 1"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task1.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 2"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task2.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 3"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task3.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 4"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task4.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 5"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task5.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 6"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task6.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 7"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task7.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 8"
            onClicked: pageStack.replace(Qt.resolvedUrl("Task8.qml"))
            width: parent.btnWidth
        }
    }
}
