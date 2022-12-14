import QtQuick 2.0
import Sailfish.Silica 1.0
import com.stringlist 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 8, задание 2"
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

    StringList {
        id: stringList
    }

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        TextField {
            id: textField;
            placeholderText: "Введите слово"
        }
        Button {
            text: "Добавить слово"
            onClicked: {
                var error = stringList.add(textField.text);
                if (error) {
                    errorLabel.visible = true
                } else {
                    errorLabel.visible = false
                }

                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            text: "Удалить последнее"
            onClicked: {
                stringList.popBack();
                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TextArea {
            id: label;
            width: parent.width;
            x: Theme.horizontalPageMargin
            text: stringList.getAll()
            readOnly: true;
        }
        Label {
            id: errorLabel
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Слово повторяется"
            visible: false
        }
    }
}
