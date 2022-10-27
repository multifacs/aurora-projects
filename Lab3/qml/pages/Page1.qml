import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TextField {
        anchors.centerIn: parent
        label: "Number 123123123"
        placeholderText: label
        horizontalAlignment: Text.AlignHCenter
        inputMethodHints: Qt.ImhDigitsOnly
        description: "Ввод числа"
    }
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        }
    }
}
