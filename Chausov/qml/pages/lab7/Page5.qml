import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "Кнопка из своего компонента"
        title: "ContextMenu"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

    Column {
        anchors.centerIn: parent

        MyButton {
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

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
