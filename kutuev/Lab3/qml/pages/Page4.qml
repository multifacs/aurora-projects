import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {

                property int counter: 0

                id: btn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Счетчик"
                onClicked: counter++
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: btn.counter
                color: "deepskyblue"
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
            }
        }
    }
}
