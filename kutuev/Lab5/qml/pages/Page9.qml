import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    Column {
        spacing: 20
        anchors.centerIn: parent
        Label {
            text: cBox.currentItem.text
        }

        TextField {
            width: 300
            id: rubles
            placeholderText: "Рубли"
        }

        Label {
            text: cBox.currentItem.text.split(' ')[cBox.currentItem.text.split(' ').length - 1].replace(/,/g, '.') * (rubles.text - 0)
        }

        Button {
            text: "debug"
            onClicked: {
                console.log(xmlListModel.get(0))
            }
        }
    }

    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "//Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
        onStatusChanged: {
            var s = "import QtQuick 2.0\n"
            s += "import Sailfish.Silica 1.0\n"
            s += "ContextMenu {\n"

            for (var i = 0; i < xmlListModel.count; i++) {
                s += "MenuItem { text: '"
                s += xmlListModel.get(i).Name + ": "
                s += xmlListModel.get(i).Value
                s += "' }\n"
            }

            //s += "MenuItem { text: 'третий' }\n"
            s += "}\n"

            const newObject = Qt.createQmlObject(s,
                                                 xmlListModel,
                                                 "myDynamicSnippet"
                                                 );
            cBox.menu = newObject
        }
    }

    ComboBox {
        id: cBox
        label: "Выбор валюты"
        anchors.bottom: parent.bottom
    }
}
