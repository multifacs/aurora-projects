import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "shapes.png"
        width: 500
        height: 500
        frameCount: 4
        frameWidth: 512 / 2
        frameHeight: 512 / 2
        frameRate: 2
        interpolate: false
    }
}
