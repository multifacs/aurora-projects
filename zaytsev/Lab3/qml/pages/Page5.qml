import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    DatePicker {
        anchors.centerIn: parent
        date: new Date()
        onDateTextChanged: console.log(this.date)
    }


    Button {
        width: 100
        x: parent.width - 100
        y: parent.height - 100
        text: "+"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
