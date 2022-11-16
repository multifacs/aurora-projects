import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        TextField {
            placeholderText: "Number"

            inputMethodHints: Qt.ImhDigitsOnly
            description: "Number"
        }

        Button {
            text: ">"
            onClicked: pageStack.push(Qt.resolvedUrl("Task2.qml"))
        }
    }
}
