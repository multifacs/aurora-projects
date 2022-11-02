import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Transform"
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

    property int rectWidth: width / 2

    Row {
        anchors.centerIn: parent

        Rectangle {
            width: rectWidth
            height: rectWidth
            color: "#000"
        }

        Rectangle {
            width: rectWidth
            height: rectWidth
            color: "#000"
            transform: [
                Scale {
                    xScale: 0.45
                },
                Rotation {
                    angle: 45
                },
                Translate {
                    x: 250
                }

            ]
        }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
