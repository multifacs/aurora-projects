import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        TimePicker {
            anchors.horizontalCenter: parent.horizontalCenter
            id: timePicker
            hour: 15
            minute: 26
            hourMode: DateTime.TwelveHours
            onTimeTextChanged: console.log(this.time)
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
            }
        }
    }
}
