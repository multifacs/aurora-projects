import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        PushUpMenu {
            MenuItem {
                text: "Задание 1"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page1.qml"))
            }
            MenuItem {
                text: "Задание 2"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page2.qml"))
            }
            MenuItem {
                text: "Задание 3"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page3.qml"))
            }
            MenuItem {
                text: "Задание 4"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page4.qml"))
            }
            MenuItem {
                text: "Задание 5"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            }
        }

        anchors.fill: parent

        Button {
            anchors.centerIn: parent
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
                    validator: DoubleValidator{}
                }
                TextField {
                    id: num2
                    width: 300
                    horizontalAlignment: TextInput.AlignHCenter
                    validator: DoubleValidator{}
                }
            }
        }
        onAccepted: {
            var parse1 = num1.text.replace(/,/g, '.') - 0
            var parse2 = num2.text.replace(/,/g, '.') - 0
            console.log(parse1 + parse2)
        }
    }
}
