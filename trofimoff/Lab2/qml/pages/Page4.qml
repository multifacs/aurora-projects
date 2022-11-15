import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Row {
        spacing: 140
        anchors.centerIn: parent
        width: black.width * 2

        Rectangle {
            id: black
            width: 200
            height: width
            color: "#000"
        }

        Rectangle {
            width: black.width
            height: black.width
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

    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl("Pages.qml"))
    }
}
