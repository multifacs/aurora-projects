import QtQuick 2.0

Rectangle {
    id: circle
    width: 200
    height: width
    color: parent.color
    radius: width*0.5
    opacity: 1

    function setOpacity(op) {
        circle.opacity = op
    }
}
