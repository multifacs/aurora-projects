import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Задание 10"
    }

    SilicaListView {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.8
        model: 20
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "Элемент " + (index + 1)
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel { text: "Меню" }
                MenuItem {
                    text: "Элемент 1"
                    onClicked: console.log("Нажат", text)
                }
                MenuItem {
                    text: "Элемент 2"
                    onClicked: console.log("Нажат", text)
                }
            }
        }
    }


    Button {
        anchors.left: parent.left
        y: 1000
        width: 160
        text: "Назад"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page9.qml")))
    }
}
