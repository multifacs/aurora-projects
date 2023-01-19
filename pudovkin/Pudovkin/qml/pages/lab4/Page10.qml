import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Switch"
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

        Label {
            text: "Сколько веток в нижегородском метро?"
        }

        TextSwitch {
            id: sw1
            text: "2"
            onClicked: {
                sw2.checked = false
                sw3.checked = false
                sw4.checked = false
            }
        }
        TextSwitch {
            id: sw2
            text: "3"
            onClicked: {
                sw1.checked = false
                sw3.checked = false
                sw4.checked = false
            }
        }
        TextSwitch {
            id: sw3
            text: "4"
            onClicked: {
                sw2.checked = false
                sw1.checked = false
                sw4.checked = false
            }
        }
        TextSwitch {
            id: sw4
            text: "5"
            onClicked: {
                sw2.checked = false
                sw3.checked = false
                sw1.checked = false
            }
        }


        Label {
            text: "Сколько цветов в радуге?"
        }

        TextSwitch {
            id: sw5
            text: "7"
            onClicked: {
                sw6.checked = false
                sw7.checked = false
                sw8.checked = false
            }
        }
        TextSwitch {
            id: sw6
            text: "8"
            onClicked: {
                sw5.checked = false
                sw7.checked = false
                sw8.checked = false
            }
        }
        TextSwitch {
            id: sw7
            text: "9"
            onClicked: {
                sw6.checked = false
                sw5.checked = false
                sw8.checked = false
            }
        }
        TextSwitch {
            id: sw8
            text: "10"
            onClicked: {
                sw6.checked = false
                sw7.checked = false
                sw5.checked = false
            }
        }

        Label {
            text: sw5.checked && sw1.checked ? "Правильно" : "Неправильно"
        }
    }
}
