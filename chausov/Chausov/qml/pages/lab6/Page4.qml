import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 6, задание 4"
    }

    IconButton {
        objectName: "aboutButton"
        icon.source: "image://theme/icon-m-rotate-left"
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: {
            pageStack.clear()
            pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

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

            delegate: Column {
                spacing: 10
                Label {
                    text: Name
                    color: "teal"
                    visible: (Value.replace(/,/g, '.') - 0) < (textField.text - 0)
                }
                Label {
                    text: Value
                    visible: (Value.replace(/,/g, '.') - 0) < (textField.text - 0)
                }
                visible: (Value.replace(/,/g, '.') - 0) < (textField.text - 0)
            }
        }
    }

    TextField {
        anchors.left: parent.left
        anchors.top: parent.top
        width: 200
        id: textField
        validator: DoubleValidator{}
        text: "100"
        onTextChanged: {
            console.log(text - 0)
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
