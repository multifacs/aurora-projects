import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 5")
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        function loadNews() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'http://www.cbr.ru/scripts/XML_daily.asp', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=ISO-8859-1')
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var resp = xhr.responseText.slice(0,20) + xhr.responseText.slice(43)
                    console.log(resp)
                    xmlListModel.xml = resp;
                }
            }
            xhr.send();
        }

        XmlListModel {
            id: xmlListModel
            query: "/ValCurs/Valute"
            XmlRole { name: "Name"; query: "Name/string()"; }
            XmlRole { name: "Value"; query: "Value/string()"; }
        }

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: Text { text: Value; }
            Component.onCompleted: {
                container.loadNews()
            }
        }
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        text: "<"
        onClicked: pageStack.pop()
    }
    Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: ">"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task6.qml")))
    }
}
