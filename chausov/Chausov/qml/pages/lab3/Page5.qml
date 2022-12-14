import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 3, задание 5"
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
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 400

            Rectangle {
                id: black
                width: 150
                height: 150
                color: "#000"
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    width: 75
                    height: width
                    color: "white"
                    anchors.centerIn: parent
                }

                ParallelAnimation {
                    id: anim1
                    running: true
                    NumberAnimation { target: black; property: "y"; to: 100; duration: 1000; }
                    NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; }
                    onStopped: anim2.start()
                }

                ParallelAnimation {
                    running: false
                    id: anim2
                    NumberAnimation { target: black; property: "y"; to: 0; duration: 1000; }
                    NumberAnimation { target: black; property: "scale"; to: 1; duration: 1000; }
                    onStopped: anim1.restart()
                }
            }
        }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
