import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "Светофор"
        title: "ContextMenu"
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

    Column {
        anchors.centerIn: parent
        spacing: circleWidth / 10

        property int circleWidth: 120
        property int delayCnt: 0

        Rectangle {
            id: redCircle
            width: parent.circleWidth
            height: width
            color: "red"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 1
        }

        Rectangle {
            id: yellowCircle
            width: parent.circleWidth
            height: width
            color: "yellow"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 0.3
        }

        Rectangle {
            id: greenCircle
            width: parent.circleWidth
            height: width
            color: "green"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 0.3
        }

        Timer {
            interval: 100; running: true; repeat: true
            onTriggered: parent.delayCnt = (parent.delayCnt + 1) % 40
        }

        state: {
            if (delayCnt < 10){
                "red"
            } else if (delayCnt < 20) {
                "yellow_red"
            } else if (delayCnt < 30) {
                "green"
            } else {
                "yellow_green"
            }
        }

        states: [
            State {
                name: "red"
                PropertyChanges { target: redCircle; opacity: 1}
                PropertyChanges { target: yellowCircle; opacity: 0.3}
                PropertyChanges { target: greenCircle; opacity: 0.3}
            },
            State {
                name: "yellow_red"
                PropertyChanges { target: redCircle; opacity: 1}
                PropertyChanges { target: yellowCircle; opacity: 1}
                PropertyChanges { target: greenCircle; opacity: 0.3}
            },
            State {
                name: "green"
                PropertyChanges { target: redCircle; opacity: 0.3}
                PropertyChanges { target: yellowCircle; opacity: 0.3}
                PropertyChanges { target: greenCircle; opacity: 1}
            },
            State {
                name: "yellow_green"
                PropertyChanges { target: redCircle; opacity: 0.3}
                PropertyChanges { target: yellowCircle; opacity: 1}
                PropertyChanges { target: greenCircle; opacity: 1}
            }
        ]
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
