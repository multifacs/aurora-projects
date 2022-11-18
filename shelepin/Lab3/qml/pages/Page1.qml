import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    TextField {
        anchors.centerIn: parent
        placeholderText: "Введите число"
        horizontalAlignment: Text.AlignHCenter
        inputMethodHints: Qt.ImhDigitsOnly
        description: "Ввод только чисел"
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
