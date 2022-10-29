import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            width: red.width + green.width + blue.width / 2
            height: red.height + green.height / 2

            Rectangle {
                id: red
                width: 200
                height: 200
                color: "#FF0000"
            }

            Rectangle {
                id: green
                width: 200
                height: 200
                color: "#00FF00"
                anchors.top: red.verticalCenter
                anchors.left: red.right
            }

            Rectangle {
                id: blue
                width: 200
                height: 200
                color: "#0000FF"
                anchors.left: green.horizontalCenter
                anchors.bottom: green.verticalCenter
            }

            Text {
                text: "Квадрат"
                color: "#FFF"
                anchors.centerIn: blue
                font.pointSize: 20
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
