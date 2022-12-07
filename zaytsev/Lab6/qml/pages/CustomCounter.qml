import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    width: 150
    height: 100

    property string num: "0"

    Label {
        text: num
        anchors.centerIn: parent
        color: "black"
    }
}
