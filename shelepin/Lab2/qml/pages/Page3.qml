import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: red.width * 3 + rectGrid.spacing * 2
            height: red.width * 2 + rectGrid.spacing * 1

            Grid {
                id: rectGrid
                spacing: 5
                columns: 3

                Rectangle {
                    id: red
                    width: 170
                    height: width
                    color: "#FF0000"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#00FF00"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#0000FF"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#F0F"
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    opacity: 0
                }

                Rectangle {
                    width: red.width
                    height: red.width
                    color: "#000"
                }
            }
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl("Pages.qml"))
    }
}

