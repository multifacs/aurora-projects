import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 4")
    }

    Column {
        anchors.centerIn: parent
        spacing: circleWidth / 10

        property int circleWidth: 100
        property int delayCnt: 0

        Svetofor {
            id: redCircle
            color: "red"
        }
        Svetofor {
            id: yellowCircle
            color: "yellow"
        }
        Svetofor {
            id: greenCircle
            color: "green"
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
                StateChangeScript {
                    script: {
                        redCircle.opacity = 1
                        yellowCircle.opacity = 0.3
                        greenCircle.opacity = 0.3
                    }
                }
            },
            State {
                name: "yellow_red"
                StateChangeScript {
                    script: {
                        redCircle.opacity = 1
                        yellowCircle.opacity = 1
                        greenCircle.opacity = 0.3
                    }
                }
            },
            State {
                name: "green"
                StateChangeScript {
                    script: {
                        redCircle.opacity = 0.3
                        yellowCircle.opacity = 0.3
                        greenCircle.opacity = 1
                    }
                }
            },
            State {
                name: "yellow_green"
                StateChangeScript {
                    script: {
                        redCircle.opacity = 0.3
                        yellowCircle.opacity = 1
                        greenCircle.opacity = 1
                    }
                }
            }
        ]
    }

    Button {
        text: "<"
        onClicked: pageStack.pop()
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
    Button {
        text: ">"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task5.qml")))
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
}
