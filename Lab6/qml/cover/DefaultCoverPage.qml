import QtQuick 2.0
import Sailfish.Silica 1.0
import "../pages"

CoverBackground {
    objectName: "defaultCover"

    Column {
        anchors.centerIn: parent
        Row {
            anchors.centerIn: parent.Center
            spacing: 5

            id: row
            property int count: 0

            MyCounter {
                width: 100
                num: parseInt(row.count / 60 / 60)
            }
            MyCounter {
                width: 100
                num: parseInt(row.count / 60)
            }
            MyCounter {
                width: 100
                num: row.count % 60
            }
        }
    }

    Timer {
        id: timer2
        interval: 1000
        repeat: true
        running: timerOn
        onTriggered: {
            row.count++
        }
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-splus-add"
            onTriggered: timerOn = !timerOn
        }
    }
}
