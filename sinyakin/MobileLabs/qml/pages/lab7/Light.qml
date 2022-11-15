import QtQuick 2.0

Rectangle {
    id: circle
    width: 120
    height: 120
    color: parent.color
    border.color: "grey"
    border.width: 2
    radius: width*0.5
    opacity: 1

    function setOpacity(op) {
        circle.opacity = op
    }
}
