import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        TextField {
            label: "123"
            placeholderText: label
            horizontalAlignment: Text.AlignHCenter
            inputMethodHints: Qt.ImhDigitsOnly
            description: "Ввод числа"
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
            }
        }
    }
}
