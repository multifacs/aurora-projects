import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 5")
    }

    Column {
        anchors.centerIn: parent

        CustomButton {
            id: myButton;
            anchors.centerIn: parent.Center
            Label {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Текст 123"
            }
            setColor: "orange"
        }

    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 40

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
            width: 200
        }
        Button {
            text: "Вперед"
            width: 200
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task6.qml")))
        }
    }
}
