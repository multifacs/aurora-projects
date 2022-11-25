import QtQuick 2.0
import Sailfish.Silica 1.0
import "func.js" as Func

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    ListModel {
        id: rectanglesModel
        ListElement { idx: 1; name: "Белый"; bgcolor: "#ffffff"; }
        ListElement { idx: 2; name: "Синий"; bgcolor: "#0000ff"; }
        ListElement { idx: 3; name: "Черный"; bgcolor: "#000000"; }
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        SilicaListView {
            anchors.fill: parent
            model: rectanglesModel
            delegate: Rectangle {
                color: bgcolor
                width: parent.width
                height: 150
                Text {
                    text: name
                    anchors.centerIn: parent
                    color: "red"
                }
            }
            spacing: 5
        }
    }

    Button {
        x: 500
        y: 1000
        width: 200
        text: "Вперед"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task2.qml")))
    }
}
