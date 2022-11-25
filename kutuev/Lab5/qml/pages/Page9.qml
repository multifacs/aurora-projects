import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {

    property double currVal: 0
    property string currName: ""

    Column {
        spacing: 20
        anchors.centerIn: parent
        Label {
            text: currName
        }
        Label {
            text: currVal
        }

        TextField {
            id: rubles
            placeholderText: "Рубли"
        }

        Label {
            text: currVal * parseInt(rubles.text)
        }

        Button {
            text: "Открыть диалог"
            onClicked: dialog.open()
        }
    }

    Dialog {
        id: dialog
        DialogHeader {}

        SilicaFlickable {
            anchors.fill: parent

            Item {
                id: container
                anchors {
                    left: parent.left; right: parent.right;
                    verticalCenter: parent.verticalCenter;
                }
                height: parent.height * 0.8

                XmlListModel {
                    id: xmlListModel
                    source: "http://www.cbr.ru/scripts/XML_daily.asp"
                    query: "//Valute"
                    XmlRole { name: "Name"; query: "Name/string()" }
                    XmlRole { name: "Value"; query: "Value/string()" }
                }

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
                            currName = Name
                            currVal = Value.replace(/,/g, '.') - 0
                            dialog.accept()
                        }
                    }
                }
            }
        }
    }
}
