import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Задание 6"
    }

    Item {
        anchors.centerIn: parent
        width: 700
        height: 900
        SilicaListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { desc: "Элемент 1"; date: "7.12.22"; }
                ListElement { desc: "Элемент 2"; date: "11.12.22"; }
                ListElement { desc: "Элемент 3"; date: "15.12.22"; }
                ListElement { desc: "Элемент 4"; date: "16.12.22"; }
                ListElement { desc: "Элемент 5"; date: "17.12.22"; }
            }
            header: PageHeader { title: "Список дел" }
            section {
                property: 'date'
                delegate: SectionHeader { text: section }
            }
            delegate: Text { text: desc }
            HorizontalScrollDecorator {}
        }

    }

    Button {
        anchors.left: parent.left
        y: 1100
        width: 160
        text: "Назад"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page5.qml")))
    }
    Button {
        anchors.right: parent.right
        y: 1100
        width: 160
        text: "Вперед"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page7.qml")))
    }
}
