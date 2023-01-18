import QtQuick 2.0
import Sailfish.Silica 1.0
import com.stringlist 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    property var words: []

    SilicaFlickable {
        anchors.fill: parent

        StringList {
            id: stringList
        }

        Column {
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            PageHeader {
                title: qsTr("Список")
            }

            TextField {
                width: 500
                id: textField;
                placeholderText: "Введите слово"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                width: 500
                text: "Добавить слово"
                onClicked: {
                    stringList.add(textField.text)
                    label.text = stringList.getAll();
                    words = stringList.getAll().split(", ")
                    console.log(words)
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                width: 500
                text: "Удалить последнее"
                onClicked: {
                    stringList.popBack();
                    label.text = stringList.getAll();
                    words = stringList.getAll().split(", ")
                    console.log(words)
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextArea {
                visible: false
                id: label;
                width: parent.width;
                x: Theme.horizontalPageMargin
                text: stringList.getAll()
                readOnly: true;
            }

            SilicaListView {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                model: words
                width: 400
                height: 300
                delegate: ListItem {
                    Label {
                        text: modelData
                    }
                    onClicked: console.log(modelData.length)
                }
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - 200
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
