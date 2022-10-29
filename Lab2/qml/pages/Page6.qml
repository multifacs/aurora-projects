import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.centerIn: parent
        spacing: 50

        Button {
            text: "Диалог"
            onClicked: dialog.open()
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl("Pages.qml"))
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
                    id: value1
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
                TextField {
                    id: value2
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                }
            }
        }
        onAccepted: {
            console.log(parseInt(value1.text) + parseInt(value2.text))
        }
    }
}
