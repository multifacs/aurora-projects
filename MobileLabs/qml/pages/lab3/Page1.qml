import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Квадраты anchors"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter
                x: 10

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

    property int rectWidth: width / 5

        Item {
            anchors.centerIn: parent
            width: parent.parent.width
            height: rectWidth * 3

            Rectangle {
                id: red
                width: rectWidth * 2
                height: width
                color: "#FF0000"
            }

            Rectangle {
                id: greed
                width: rectWidth * 2
                height: width
                color: "#00FF00"
                anchors.top: red.verticalCenter
                anchors.left: red.right
            }

            Rectangle {
                id: blue
                width: rectWidth * 2
                height: width
                color: "#0000FF"
                anchors.left: greed.horizontalCenter
                anchors.bottom: greed.verticalCenter
            }

            Text {
                text: "Квадрат"
                color: "#FFF"
                anchors.centerIn: blue
                font.pointSize: 20
            }
        }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
