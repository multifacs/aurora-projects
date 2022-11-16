import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {

    Column {
        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            placeholderText: "Имя"
        }

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 400
            placeholderText: "Фамилия"
        }

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 500
            placeholderText: "Отчество"
        }

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 600
            placeholderText: "Возраст"
            inputMethodHints: Qt.ImhDigitsOnly
        }

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 700
            placeholderText: "Город"
        }
    }

    Button {
        width: 100
        y: parent.height - 100
        text: "-"
        onClicked: pageStack.pop()
    }
}
