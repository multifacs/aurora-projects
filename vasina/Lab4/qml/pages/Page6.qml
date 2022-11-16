import QtQuick 2.0
import Sailfish.Silica 1.0
import "../."

Page {

    property int difference: 999999999

    Item {
        anchors.centerIn: parent
        width: 700
        height: 900
        SilicaListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { desc: "Дело 1"; date: "123"; day: 22 }
                ListElement { desc: "Дело 2"; date: "11.12.22"; day: 25 }
                ListElement { desc: "Дело 3"; date: "15.12.22"; day: 26 }
            }
            header: PageHeader { title: "Список дел" }
            section {
                property: 'date'
                delegate: SectionHeader { text: section }
            }
            delegate: Text {
                text: desc
                Component.onCompleted: {
                    var newDate = new Date()
                    newDate.setDate(day)
                    date = newDate.toLocaleDateString()
                    var diff = newDate - new Date()
                    if (difference > diff) {
                        task1 = desc
                        difference = diff
                    }

                    console.log(difference)
                }
            }
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
