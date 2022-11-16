import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 3, задание 6"
    }

    IconButton {
        objectName: "aboutButton"
        icon.source: "image://theme/icon-m-rotate-left"
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: {
            pageStack.clear()
            pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 50

        Button {
            text: "Открыть диалог"
            onClicked: dialog.open()
        }
    }

    Dialog {
        id: dialog
        Column {
            anchors.fill: parent
            spacing: Theme.paddingMedium
            DialogHeader { }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                TextField {
                    id: num1
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
                TextField {
                    id: num2
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
            }
        }
        onAccepted: console.log(parseInt(num1.text) + parseInt(num2.text))
    }
}
