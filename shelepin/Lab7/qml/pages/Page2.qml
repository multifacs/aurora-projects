import QtQuick 2.0
import Sailfish.Silica 1.0
import com.stringlist 1.0

Page {

    StringList {
        id: stringList
    }

    Column {
        id: column
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        y: 300

        TextField {
            id: textField;
            placeholderText: "Введите слово"
        }

        SilicaListView {
            id: view
            width: 300
            height: 300
            model: list
            delegate: Label {
                text: txt
                Component.onCompleted: {
                    var rus = 0;
                    var eng = 0;
                    for (var i = 0; i < text.length; i++) {
                        if (text.charCodeAt(i) >= 65 && text.charCodeAt(i) <= 122) eng++
                        if (text.charCodeAt(i) >= 1040 && text.charCodeAt(i) <= 1100) rus++
                        console.log(text.charCodeAt(i))
                    }
                    if (rus > 0 && eng === 0) color = "red"
                    if (rus === 0 && eng > 0) color = "green"
                    if (rus > 0 && eng > 0) color = "yellow"
                    console.log(rus, eng)
                }
            }
        }

        ListModel {
            id: list
        }

        Button {
            text: "Добавить"
            onClicked: {
                stringList.add(textField.text)
                column.load()
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            text: "Стереть"
            onClicked: {
                stringList.popBack();
                column.load()
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        function load() {
            var l = stringList.getAll().split(", ")
            list.clear()
            for (var i = 0; i < l.length; i++) {
                console.log(l[i])
                list.append({ txt: l[i] })
            }
            console.log(list.rowCount())
        }

    }
}
