import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Label {
        anchors.centerIn: parent
        text: qsTr("Глубина стека: %1").arg(pageStack.depth)
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Вперед"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Page1_%1.qml").arg((pageStack.depth + 1) % 4)))
    }
}
