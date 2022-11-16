import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Grid {
        columns: 1
        property int btnWidth: 400
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Задание 1"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page1_1.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 2"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page2_1.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 3"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page3.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 4"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page4.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 5"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 6"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 7"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page7.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 8"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page8.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 9"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page9.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 10"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page10.qml"))
            width: parent.btnWidth
        }
    }
}
