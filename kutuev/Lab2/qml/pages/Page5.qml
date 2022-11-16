import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 400

            Rectangle {
                id: black
                width: 150
                height: 150
                color: "#000"
                anchors.horizontalCenter: parent.horizontalCenter

                ParallelAnimation {
                    running: true
                    NumberAnimation { target: black; property: "y"; to: 100; duration: 1000; loops: Animation.Infinite }
                    NumberAnimation { target: black; property: "scale"; to: 2; duration: 1000; loops: Animation.Infinite }
                }
            }
        }
        Row {
            spacing: 10
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
            }
        }
    }

}
