import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.0

Page {
    Camera {
        id: camera
        flash.mode: CameraFlash.FlashOff
    }

    IconTextSwitch {
        anchors.centerIn: parent
        text: "Вспышка"
        icon.source: "image://theme/icon-m-flashlight?" + (checked
                                             ? Theme.highlightColor
                                             : Theme.primaryColor)
        width: 400
        description: "Включить вспышку"
        onCheckedChanged: {
            if (checked) {
                camera.flash.mode = CameraFlash.FlashTorch
            } else {
                camera.flash.mode = CameraFlash.FlashTorch
            }
        }
    }
}
