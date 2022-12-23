import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "sun.png"
        width: 500
        height: 500
        frameCount: 4
        frameWidth: 200 / 2
        frameHeight: 200 / 2
        frameRate: 4
        interpolate: false
        smooth: false
    }
}
