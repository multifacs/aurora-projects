import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 6, задание 2"
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
                height: 200
                Text {
                    text: idx + " " + name
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var afterDelete = -1;
                        for (var i = 0; i < rectanglesModel.rowCount(); i++) {

                            if (rectanglesModel.get(i).idx === idx) {
                                rectanglesModel.remove(i)
                                afterDelete = i 
                            }

                            if (afterDelete !== -1 && i !== rectanglesModel.rowCount()) {
                                rectanglesModel.get(i).idx--
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
                bottom: parent.bottom;
                horizontalCenter: parent.horizontalCenter;
            }
            onClicked: {
                var prev = rectanglesModel.rowCount() - 3
                prev = prev < 0 ? 0 : prev

                var newName = rectanglesModel.get(prev)
                newName = newName === undefined ? "Белый" : newName.name
                var newColor = rectanglesModel.get(prev)
                newColor = newColor === undefined ? "#fff" : newColor.bgcolor

                rectanglesModel.append({
                                           idx: rectanglesModel.rowCount() + 1,
                                           name: newName,
                                           bgcolor: newColor
                                       })
            }
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
