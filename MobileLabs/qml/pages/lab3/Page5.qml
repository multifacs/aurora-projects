import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Animation"
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

                ParallelAnimation {
                    running: true
                    id: a1
                    NumberAnimation { target: black; property: "y"; to: 100; duration: 1000; }
                    NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; }
                    onStopped: a2.start()
                }

                ParallelAnimation {
                    running: false
                    id: a2
                    NumberAnimation { target: black; property: "y"; to: 0; duration: 1000; }
                    NumberAnimation { target: black; property: "scale"; to: 1; duration: 1000; }
                    onStopped: a1.restart()
                }

                Label {
                    text: "Квадрат"
                    anchors.centerIn: parent
                    color: "red"
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
