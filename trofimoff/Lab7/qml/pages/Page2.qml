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

        TextField {
            id: label;
            width: parent.width;
            x: Theme.horizontalPageMargin
            text: stringList.getAll()
            readOnly: true;
        }

        Button {
            text: "Добавить"
            onClicked: {
                stringList.add(textField.text)
                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            text: "Стереть"
            onClicked: {
                stringList.popBack();
                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 400
        text: "Счетчик"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page1.qml")))
    }
}
