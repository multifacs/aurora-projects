import QtQuick 2.0
import Sailfish.Silica 1.0
import com.stringlist 1.0

Page {
    property var words: []
    PageHeader {
        objectName: ""
        title: "Список"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

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
                model: words
                width: 400
                height: 300
                delegate: ListItem {
                    Label {
                        text: modelData
                    }
                    onClicked: {
                        var vCount = 0
                        var cCount = 0

                        var vowels = ["a","e","i","o","u"];

                        for (var i = 0; i < modelData.length; i++) {
                            if (vowels.indexOf(modelData[i].toLowerCase()) >= 0) {
                                vCount++
                            } else {
                                cCount++
                            }
                        }

                        console.log("гласные:", vCount, ", согласные:", cCount)
                    }
                }
            }
        }
    }
}
