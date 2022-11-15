import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Квадраты row column"
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

    property int rectWidth: width / 3

    Row {
        anchors.centerIn: parent
        width: parent.parent.width
        height: rectWidth * 2

        Column {

            Rectangle {
                width: rectWidth
                height: rectWidth
                color: "#FF0000"
            }

            Rectangle {
                width: rectWidth
                height: rectWidth
                color: "#F0F"
            }
        }

        Column {

            Rectangle {
                width: rectWidth
                height: rectWidth
                color: "#00FF00"
            }
        }

        Column {

            Rectangle {
                width: rectWidth
                height: rectWidth
                color: "#0000FF"
            }

            Rectangle {
                width: rectWidth
                height: rectWidth
                color: "#000"
            }
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }

}
