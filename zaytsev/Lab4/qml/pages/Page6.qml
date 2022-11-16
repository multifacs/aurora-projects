import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Item {
        anchors.centerIn: parent
        width: 700
        height: 900
        SilicaListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { desc: "Элемент списка 1"; date: "7.12.22"; }
                ListElement { desc: "Элемент списка 2"; date: "11.12.22"; }
                ListElement { desc: "Элемент списка 3"; date: "15.12.22"; }
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
        x: 100
        y: 1100
        width: 160
        text: "Пред"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page5.qml")))
    }
    Button {
        x: 500
        y: 1100
        width: 160
        text: "След"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page7.qml")))
    }
}
