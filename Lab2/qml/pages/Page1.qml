import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 375
            height: 225

            Rectangle {
                id: red
                width: 150
                height: 150
                color: "#FF0000"
            }

            Rectangle {
                id: greed
                width: 150
                height: 150
                color: "#00FF00"
                anchors.top: red.verticalCenter
                anchors.left: red.right
            }

            Rectangle {
                id: blue
                width: 150
                height: 150
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

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
            }
        }
    }
}
