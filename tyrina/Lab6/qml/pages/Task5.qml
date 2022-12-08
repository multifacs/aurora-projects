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

        ButtonLabel {
            id: myButton;
            anchors.centerIn: parent.Center
            Label {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Тексты совпадают"
            }
            setColor: "red"
        }

    }

    Button {
        text: "<"
        onClicked: pageStack.pop()
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
    Button {
        text: ">"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task6.qml")))
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
}
