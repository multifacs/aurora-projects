import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    SilicaListView {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.8
        model: 10
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "Элемент списка " + (index + 1)
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
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
