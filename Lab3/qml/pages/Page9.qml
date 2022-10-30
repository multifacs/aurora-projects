import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        Slider {
            id: slider
            label: "Ползунок"
            width: 700
            minimumValue: 0
            maximumValue: 100
            value: 25
            stepSize: 1
            valueText: value
            onValueChanged: console.log(value)
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: slider.value
        }
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
