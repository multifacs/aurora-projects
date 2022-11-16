import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        Slider {
            width: 500
            label: "Ползунок"
            maximumValue: 40
            minimumValue: -10
            value: 10
            stepSize: 1
            valueText: value
            onValueChanged: console.log(value)
            id: slider
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Значение: " + slider.value
        }
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 10
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
