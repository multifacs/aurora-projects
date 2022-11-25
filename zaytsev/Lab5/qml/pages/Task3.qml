import QtQuick 2.0
import Sailfish.Silica 1.0
import "func.js" as Func

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        property var rectanglesModel: [
            { idx: 1, name: "Белый", bgcolor: "#ffffff" },
            { idx: 2, name: "Синий", bgcolor: "#0000ff" },
            { idx: 3, name: "Черный", bgcolor: "#000000" },
            { idx: 4, name: "Зеленый", bgcolor: "#00ff00" },
        ]

        SilicaListView {
            anchors.fill: parent
            model: container.rectanglesModel
            delegate: Rectangle {
                color: modelData.bgcolor
                width: parent.width
                height: 150
                Text {
                    text: modelData.name
                    anchors.centerIn: parent
                    color: "red"
                }
            }
            spacing: 5
        }
    }

    Button {
        x: 500
        y: 1100
        width: 200
        text: "Вперед"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task4.qml")))
    }
    Button {
        x: 20
        y: 1100
        width: 200
        text: "Назад"
        onClicked: pageStack.pop()
    }
}
