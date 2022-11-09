import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Item {
        anchors.centerIn: parent
        width: 500
        height: 700
        SilicaListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { desc: "Дело 1"; date: "5.10.22"; }
                ListElement { desc: "Дело 2"; date: "7.10.22"; }
                ListElement { desc: "Дело 3"; date: "10.10.22"; }
                ListElement { desc: "Дело 4"; date: "10.10.22"; }
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
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
