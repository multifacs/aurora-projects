import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "clock.png"
        width: 500
        height: 500
        frameCount: 12
        frameWidth: 768 / 3
        frameHeight: 1024 / 4
        frameRate: 4
        interpolate: false
    }
}
