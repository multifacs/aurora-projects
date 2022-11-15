import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 7, задание 4"
    }

    IconButton {
        objectName: "aboutButton"
        icon.source: "image://theme/icon-m-rotate-left"
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: {
            pageStack.clear()
            pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: circleWidth / 10

        property int circleWidth: 100
        property int delayCnt: 0

        TrafficLight {
            id: redCircle
            color: "red"
        }
        TrafficLight {
            id: yellowCircle
            color: "yellow"
        }
        TrafficLight {
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

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
