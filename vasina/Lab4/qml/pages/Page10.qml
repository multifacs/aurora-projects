import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    SilicaListView {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.8
        model: 7
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
                    text: "Пункт 1"
                    onClicked: console.log("Нажат", text)
                }
                MenuItem {
                    text: "Пункт 2"
                    onClicked: console.log("Нажат", text)
                }
            }
        }
    }


    Button {
        x: 100
        y: 1000
        width: 160
        text: "Пред"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page9.qml")))
    }
}
