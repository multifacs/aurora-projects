import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "DatePicker"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

    DatePicker {
        anchors.centerIn: parent
        date: new Date()
        daysVisible: true
        weeksVisible: true
        onDateTextChanged: console.log(this.date)
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
