import QtQuick 2.0

Rectangle {
    id: circle
    width: 130
    height: 130
    color: parent.color
    border.color: "grey"
    border.width: 2
    radius: width*0.5
    opacity: 1

    function setOpacity(op) {
        circle.opacity = op
    }
}
