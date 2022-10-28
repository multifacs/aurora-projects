import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 350
            height: 150

            Row {
                spacing: 150

                Rectangle {
                    width: 150
                    height: 150
                    color: "#000"
                }

                Rectangle {
                    width: 150
                    height: 150
                    color: "#000"
                    transform: [
                        Scale {
                            xScale: 0.5
                        },
                        Rotation {
                            angle: 45
                        }
                    ]
                }
            }
        }
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 10
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        }
    }
}
