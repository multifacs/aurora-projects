import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 100

        Button {
            id: btn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Кнопка"
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: btn.down ? "Нажата" : "Не нажата"
        }
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}

