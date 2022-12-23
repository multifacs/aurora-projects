import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "snake.png"
        width: 500
        height: 500
        frameCount: 4
        frameWidth: 1024 / 2
        frameHeight: 1024 / 2
        frameRate: 4
        interpolate: false
    }
}
