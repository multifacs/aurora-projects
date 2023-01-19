import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Image {
        anchors.fill: parent
        source: "./loc2.jpg"

        Button {
            anchors.centerIn: parent
            text: "Заново"
            color: "white"
            onClicked: {
                locLoad.visible = true
                loc1.visible = true
            }
        }
    }

    Image {
        id: locLoad
        anchors.fill: parent
        source: "./loading.jpg"

        Row {
            anchors.horizontalCenter: parent.horizontalAlignment
            anchors.bottom: parent.bottom
            spacing: 20

            AnimatedSprite {
                source: "loading-removebg-preview.png"
                width: 500
                height: 200
                frameCount: 7
                frameWidth: 387 / 1
                frameHeight: 644 / 7
                frameRate: 5
                interpolate: false
            }
            AnimatedSprite {
                source: "loadsprite.png"
                width: 200
                height: 200
                frameCount: 16
                frameWidth: 2000 / 4
                frameHeight: 2000 / 4
                frameRate: 5
                interpolate: false
            }
        }

        Timer {
            id: timer
            interval: 3000
            onTriggered: parent.visible = false
        }
    }

    Image {
        id: loc1
        anchors.fill: parent
        source: "./loc1.jpg"

        Button {
            anchors.centerIn: parent
            text: "Перейти на локацию?"
            color: "white"
            onClicked: {
                parent.visible = false
                timer.start()
            }
        }
    }
}
