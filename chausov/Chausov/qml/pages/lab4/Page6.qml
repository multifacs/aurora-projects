import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 4, задание 6"
    }

    IconButton {
        objectName: "aboutButton"
        icon.source: "image://theme/icon-m-rotate-left"
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: {
            pageStack.clear()
            pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

    TimePicker {
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        id: timePicker
        hour: 15
        minute: 26
        hourMode: DateTime.TwelveHours
        onTimeTextChanged: console.log(this.time)
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
