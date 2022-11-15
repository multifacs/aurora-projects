import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: red.width * 3 + rectRow.spacing * 2
            height: red.width * 2 + rectRow.spacing

            Row {
                id: rectRow
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5

                Column {
                    spacing: 5

                    Rectangle {
                        id: red
                        width: 170
                        height: width
                        color: "#FF0000"
                    }

                    Rectangle {
                        width: red.width
                        height: red.width
                        color: "#F0F"
                    }
                }

                Column {
                    spacing: 5

                    Rectangle {
                        width: red.width
                        height: red.width
                        color: "#00FF00"
                    }
                }

                Column {
                    spacing: 5

                    Rectangle {
                        width: red.width
                        height: red.width
                        color: "#0000FF"
                    }

                    Rectangle {
                        width: red.width
                        height: red.width
                        color: "#000"
                    }
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
