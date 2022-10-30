import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    DatePicker {
        anchors.centerIn: parent
        date: new Date()
        onDateTextChanged: console.log(this.date)
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
