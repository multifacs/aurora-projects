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
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
