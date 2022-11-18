import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TimePicker {
        id: time
        anchors.centerIn: parent
        hour: 6
        minute: 30
        hourMode: DateTime.TwelveHours
        onTimeTextChanged: slider.value = minute
        Label {
            anchors.centerIn: parent
            text: parent.hour + ":" + parent.minute
            font.pixelSize: 100
        }
    }

    Slider {
        id: slider
        label: "Ползунок"
        width: 700
        minimumValue: 0
        maximumValue: 60
        value: 25
        stepSize: 1
        valueText: value
        onValueChanged: time.minute = value
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 950
        text: "Сделать 24 часа"
        onClicked: {
            console.log(time.hourMode)

            if (time.hourMode === 2) {
                time.hourMode = 1
                text = "Сделать 12 часов"
            } else if (time.hourMode === 1) {
                time.hourMode = 2
                text = "Сделать 24 часа"
                time.hour = time.hour % 12
            }
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
