import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {

    TimePicker {
        anchors.centerIn: parent

        id: timePicker
        hour: 6
        minute: 30

        onTimeTextChanged: {
            console.log(this.time)
            Store.time = time
        }
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 500
        text: timePicker.timeText
    }


    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
