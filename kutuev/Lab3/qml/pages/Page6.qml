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
            onTimeTextChanged: console.log(slider.value = minute)
        }

        Column {
            Slider {
                width: 500
                label: "Ползунок"
                minimumValue: 0
                maximumValue: 60
                value: timePicker.minute
                stepSize: 1
                valueText: value
                onValueChanged: console.log(timePicker.minute = value)
                id: slider
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Значение: " + slider.value
            }
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
