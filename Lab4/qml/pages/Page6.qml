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
                ListElement { desc: "Element 1"; date: "7.12.22"; }
                ListElement { desc: "Element 2"; date: "11.12.22"; }
                ListElement { desc: "Element 3"; date: "15.12.22"; }
                ListElement { desc: "Element 4"; date: "16.12.22"; }
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
        anchors.bottom: parent.bottom
        width: 100
        text: "<"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page5.qml")))
    }
    Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 100
        text: ">"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page7.qml")))
    }
}
