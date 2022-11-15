import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 350
            height: 300

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5

                Column {
                    spacing: 5

                    Rectangle {
                        width: 150
                        height: 150
                        color: "#FF0000"
                    }

                    Rectangle {
                        width: 150
                        height: 150
                        color: "#F0F"
                    }
                }

                Column {
                    spacing: 5

                    Rectangle {
                        width: 150
                        height: 150
                        color: "#00FF00"
                    }
                }

                Column {
                    spacing: 5

                    Rectangle {
                        width: 150
                        height: 150
                        color: "#0000FF"
                    }

                    Rectangle {
                        width: 150
                        height: 150
                        color: "#000"
                    }
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
            onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
        }
    }

}
