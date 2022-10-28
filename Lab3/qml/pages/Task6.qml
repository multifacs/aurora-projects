import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        spacing: 100
        anchors.centerIn: parent

        TimePicker {
            hour: 2
            minute: 45
            onTimeTextChanged: console.log(this.time)
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
