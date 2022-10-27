import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        spacing: 50

        ComboBox {
            label: "Выпадающий список"
            description: "Описание выпадающего списка"
            menu: ContextMenu {
                MenuItem { text: "первый" }
                MenuItem { text: "второй" }
                MenuItem { text: "третий" }
            }
            onCurrentIndexChanged: console.log(value)
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }

            Button {
                text: "Вперёд"
                onClicked: pageStack.push(Qt.resolvedUrl("Page8.qml"))
            }
        }
    }
}
