import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property bool swtch: false

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

        ParallelAnimation {
            id: anim1
            running: false
            PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 800; duration: 1000;}
            PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "white"; duration: 1000;}
            RotationAnimation { target: tgt; from: 0; to: 180; duration: 1000;}
            onStopped: anim2.start()
        }

        ParallelAnimation {
            id: anim2
            running: false
            PropertyAnimation { target: tgt; properties: "y"; from: 800; to: 100; duration: 1000;}
            PropertyAnimation { target: tgt; properties: "color"; from: "white"; to: "blue"; duration: 1000;}
            RotationAnimation { target: tgt; from: 180; to: 0; duration: 1000;}
            onStopped: if (swtch) anim1.restart()
        }

        ParallelAnimation {
            id: anim3
            running: false
            PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 100; duration: 1000;}
            PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "blue"; duration: 1000;}
            RotationAnimation { target: tgt; from: tgt.rotation; to: 0; duration: 1000;}
        }
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

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPressed: {
            anim1.restart()
            swtch = true
        }
        onReleased: {
            anim2.stop()
            anim1.stop()
            anim3.start()
            swtch = false
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
