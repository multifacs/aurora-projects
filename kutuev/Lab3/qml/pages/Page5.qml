import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        DatePicker {
            date: new Date()
            daysVisible: true
            weeksVisible: true
            onDateTextChanged: console.log(this.date)
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
                onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
            }
        }
    }
}
