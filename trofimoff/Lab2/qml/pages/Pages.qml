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
            onClicked: pageStack.replace(Qt.resolvedUrl("Page1.qml"))
            width: parent.btnWidth
        }
        Button {
            text: "Задание 2"
            onClicked: pageStack.replace(Qt.resolvedUrl("Page2.qml"))
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
    }
}
