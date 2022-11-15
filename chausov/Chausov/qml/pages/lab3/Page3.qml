import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 3, задание 3"
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
            width: 460
            height: 305

            Grid {
                spacing: 5
                columns: 3

                Rectangle {
                    width: 150
                    height: 150
                    color: "#FF0000"
                }

                Rectangle {
                    width: 150
                    height: 150
                    color: "#00FF00"
                }

                Rectangle {
                    width: 150
                    height: 150
                    color: "#0000FF"
                }

                Rectangle {
                    width: 150
                    height: 150
                    color: "#F0F"
                }

                Rectangle {
                    width: 150
                    height: 150
                    opacity: 0
                }

                Rectangle {
                    width: 150
                    height: 150
                    color: "#000"
                }
            }
        }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}

