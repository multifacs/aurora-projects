import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TimePicker {
        anchors.centerIn: parent
        hour: 6
        minute: 30
        hourMode: DateTime.TwelveHours
        onTimeTextChanged: console.log(this.time)
        Label {
            anchors.centerIn: parent
            text: parent.hour + ":" + parent.minute
            font.pixelSize: 100
        }
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
