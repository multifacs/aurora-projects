import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-splus-add"
            onTriggered: timerOn = !timerOn
        }
    }
}
