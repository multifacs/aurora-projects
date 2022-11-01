import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "Текст с анимацией"
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

    Label {
        id: tgt
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
        text: "Hello"
        color: "blue"
        font.pixelSize: 200
        horizontalAlignment: Text.AlignHCenter
    }

    state: {
        if (mouseArea.pressedButtons){
            "way"
        } else {
            "back"
        }
    }

    states: [
        State {
            name: "way"
        },
        State {
            name: "back"
        }
    ]

    transitions: [
        Transition {
            from: "back"
            to: "way"
            ParallelAnimation {
                PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 800; duration: 1000;}
                PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "white"; duration: 1000;}
                RotationAnimation { target: tgt; from: 0; to: 180; duration: 1000;}
            }
        },
        Transition {
            from: "way"
            to: "back"
            PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 100; duration: 1000}
            PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "blue"; duration: 1000;}
            RotationAnimation { target: tgt; from: tgt.rotation; to: 0; duration: 1000;}

        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPressed: {
            console.log("123")
            console.log(mouseArea.pressedButtons)
        }
        onReleased: {
            console.log(mouseArea.pressedButtons)
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
