import QtQuick 2.0

Rectangle {
    border.color: "black"
    border.width: 3
    width: 150
    height: width
    property int num: 1
    property bool active: false
    property string color: "red"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            grid.move(num, false)
            timer.start()
        }
    }
    Text {
        text: parent.num
        anchors.centerIn: parent
    }
    Rectangle {
        color: parent.color
        width: 90
        height: width
        radius: 45
        anchors.centerIn: parent
        visible: parent.active
    }
}
