import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 4, задание 4"
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

    Column {
        anchors.centerIn: parent
        spacing: 100

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {

                property int counter: 0

                id: btn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Счетчик"
                onClicked: counter++
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: btn.counter
                color: "deepskyblue"
            }
        }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
