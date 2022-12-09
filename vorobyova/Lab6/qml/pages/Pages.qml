import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Grid {
        columns: 1
        property int btnWidth: 250
        anchors.centerIn: parent
        spacing: 20

        TimePicker {
            id: timePicker1
        }

        Timer {
            property int minutes: 0
            id: timer2
            interval: 10
            repeat: true
            running: timerRunning
            onTriggered: {
                minutes += 30
                timePicker1.minute = parseInt(minutes / 1000 % 60)
            }

            Component.onCompleted: {
                console.log(timerRunning)
            }
        }

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
    }
}
