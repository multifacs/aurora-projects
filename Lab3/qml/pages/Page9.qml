import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Slider {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300

        width: 500

        maximumValue: 10
        minimumValue: 0
        value: 5
        stepSize: 1

        onValueChanged: console.log(value)
        id: slider
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 400
        text: slider.value
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
