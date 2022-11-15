import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {
    Column {
        spacing: 100
        anchors.centerIn: parent

        TimePicker {
            id: timePicker
            hour: 5
            minute: 10
            onTimeTextChanged: console.log(this.time)
        }

        Timer {
            id: timer
            interval: 1000
            running: Store.run
            repeat: true
            onTriggered: {
                if (timePicker.minute === 59) {
                    timePicker.minute = 0
                    timePicker.hour++
                }
                timePicker.minute++

            }
        }

        Button {
            text: ">"
            onClicked: pageStack.push(Qt.resolvedUrl("Task7.qml"))
        }
        Button {
            text: "<"
            onClicked: pageStack.pop()
        }
    }
}
