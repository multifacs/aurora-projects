import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Конвертер")
    }

    property string cur1: ""
    property string cur2: ""
    property double rate1: 0
    property double rate2: 0
    property double result: 0

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        Column {
            anchors.centerIn: parent

            Button {
                text: rate1 ? cur1 : "Валюта 1"
                onClicked: dialog1.open()
            }
            Label {
                font.pixelSize: 25
                text: "в рублях: " + rate1
            }

            Button {
                text: rate2 ? cur2 : "Валюта 2"
                onClicked: dialog2.open()
            }
            Label {
                font.pixelSize: 25
                text: "в рублях: " + rate2
            }

            TextField {
                id: amount
                placeholderText: "Количество"
            }
            Button {
                text: "Рассчитать"
                onClicked: {
                    var num = amount.text - 0
                    if (num) {
                        console.log(num)
                        result = rate1 * num / rate2
                    }
                }
            }
            Label {
                text: result
            }
        }
    }

    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "//Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
    }

    Dialog {
        id: dialog1

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: ListItem {
                Text { text: Value; }
                onClicked: {
                    cur1 = Name
                    rate1 = Value.replace(/,/g, '.') - 0
                    dialog1.accept()
                }
            }
        }
    }

    Dialog {
        id: dialog2

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: ListItem {
                Text { text: Value; }
                onClicked: {
                    cur2 = Name
                    rate2 = Value.replace(/,/g, '.') - 0
                    dialog2.accept()
                }
            }
        }
    }
}
