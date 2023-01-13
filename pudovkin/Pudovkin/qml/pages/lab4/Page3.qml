import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Button.down"
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

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Button {
                id: btn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Нажать!"
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: btn.down ? "Нажато" : "Не нажато"
            }
        }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}

