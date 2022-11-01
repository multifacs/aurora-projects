import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "ComboBox"
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

    ComboBox {
        anchors.centerIn: parent
        label: "Выпадающий список"
        description: "Описание выпадающего списка"
        menu: ContextMenu {
            MenuItem { text: "первый" }
            MenuItem { text: "второй" }
            MenuItem { text: "третий" }
        }
        onCurrentIndexChanged: console.log(value)
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page8.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
