import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Delegate"
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

    ListModel {
        id: rectanglesModel
        ListElement { idx: 1; name: "Белый"; bgcolor: "#ffffff"; textColor: "black" }
        ListElement { idx: 2; name: "Синий"; bgcolor: "#0000ff"; textColor: "black" }
        ListElement { idx: 3; name: "Черный"; bgcolor: "#000000"; textColor: "white" }
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        SilicaListView {
            id: list
            anchors.fill: parent
            model: rectanglesModel
            delegate: Rectangle {
                color: bgcolor
                width: parent.width
                height: 200
                Text {
                    text: name
                    anchors.centerIn: parent
                    color: textColor
                }
            }
            spacing: 5
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Создать"
            onClicked: dialog.open()
            anchors.top: list.bottom
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }

    Dialog {
        id: dialog
        Column {
            anchors.fill: parent
            spacing: Theme.paddingMedium
            DialogHeader { }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                id: bgColorField
                width: 400
                placeholderText: "Цвет фона"
            }
            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                id: textField
                width: 400
                placeholderText: "Текст"
            }
            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                id: textColorField
                width: 400
                placeholderText: "Цвет текста"
            }
        }
        onAccepted: {
            rectanglesModel.append({
                                       "idx": rectanglesModel.count + 1,
                                       "name": textField.text,
                                       "bgcolor": bgColorField.text,
                                       "textColor": textColorField.text
                                   })
        }
    }
}
