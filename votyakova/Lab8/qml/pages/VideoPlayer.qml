import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    Video {
        id: video
        width: parent.width
        height: 405
        source: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.ogv"
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: video.bottom
        anchors.topMargin: 50
        IconButton {
            icon.source: "image://theme/icon-m-media-rewind"
            onClicked: video.seek(video.position - 5000)
        }
        IconButton {
            id: play
            icon.source: "image://theme/icon-m-play"
            onClicked: {
                if (play.icon.source == "image://theme/icon-m-play") {
                    video.play();
                    play.icon.source = "image://theme/icon-m-pause"
                } else {
                    video.pause()
                    play.icon.source = "image://theme/icon-m-play"
                }
            }
        }
        IconButton {
            icon.source: "image://theme/icon-m-media-forward"
            onClicked: video.seek(video.position + 5000)
        }
    }
}
