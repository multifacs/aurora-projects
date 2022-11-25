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

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for (var i = 0; i < rectanglesModel.rowCount(); i++) {
                            if (rectanglesModel.get(i).idx === idx) {
                                rectanglesModel.remove(i)
                            }
                        }
                    }
                }
            }
            spacing: 5
        }

        Button {
            text: "Добавить"
            anchors {
                horizontalCenter: parent.horizontalCenter;
            }
            y: 900
            width: 200
            onClicked: {
                var newName = "Зеленый"
                var newColor = "green"
                rectanglesModel.append({
                                           idx: rectanglesModel.rowCount() + 1,
                                           name: newName,
                                           bgcolor: newColor
                                       })
            }
        }
    }

    Button {
        x: 500
        y: 1100
        width: 200
        text: "Вперед"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task3.qml")))
    }
    Button {
        x: 20
        y: 1100
        width: 200
        text: "Назад"
        onClicked: pageStack.pop()
    }
}
