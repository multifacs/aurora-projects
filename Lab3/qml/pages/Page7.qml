import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ComboBox {
        anchors.centerIn: parent
        label: "Выпадающий список"
        description: "Описание выпадающего списка"
        menu: ContextMenu {
            MenuItem { text: "Элемент списка 1" }
            MenuItem { text: "Элемент списка 2" }
            MenuItem { text: "Элемент списка 3" }
        }
        onCurrentIndexChanged: console.log(value)
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl("Pages.qml"))
    }
}
