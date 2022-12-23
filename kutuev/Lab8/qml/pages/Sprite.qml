import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "fish.png"
        width: 500
        height: 500
        frameCount: 2
        frameWidth: 256 / 1
        frameHeight: 512 / 2
        frameRate: 2
        interpolate: false
    }
}
