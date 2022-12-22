import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    AnimatedSprite {
        anchors.centerIn: parent
        source: "pavuk.png"
        width: 640
        height: 640
        frameCount: 5
        frameWidth: 64 / 2
        frameHeight: 96 / 3
        frameRate: 4
        interpolate: false
        smooth: false
    }
}
