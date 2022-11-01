import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "Игра Ним"
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
        spacing: 100

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Выберите количество предметов в кучке: "
        }

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Количество"
            onTextChanged: count = parseInt(text)
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: count
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Начать"
            onClicked: {
                if (count > 1) {
                    pageStack.replace(Qt.resolvedUrl("GamePage.qml"))
                }
            }
        }
    }
}
