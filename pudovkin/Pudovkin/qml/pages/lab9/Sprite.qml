import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "light.png"
        width: 500
        height: 500
        frameCount: 7
        frameWidth: 1536 / 3
        frameHeight: 1536 / 3
        frameRate: 6
        interpolate: false
    }
}
