import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Задание 7"
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        SlideshowView {
            id: view
            anchors.centerIn: parent
            height: width
            itemHeight: width; itemWidth: width;
            model:     ListModel {
                ListElement { desc: "Элемент 1"; date: "7.12.22"; }
                ListElement { desc: "Элемент 2"; date: "16.12.22"; }
                ListElement { desc: "Элемент 3"; date: "16.12.22"; }
                ListElement { desc: "Элемент 4"; date: "16.12.22"; }
                ListElement { desc: "Элемент 5"; date: "17.12.22"; }
            }
            delegate: Rectangle {
                width: view.itemWidth;
                height: view.itemHeight;
                color: "white"
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 100
                    text: date
                }
                Text {
                    anchors.centerIn: parent
                    text: desc
                }
            }
        }

    }

    Button {
        anchors.left: parent.left
        y: 1000
        width: 160
        text: "Назад"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page7.qml")))
    }
    Button {
        anchors.right: parent.right
        y: 1000
        width: 160
        text: "Вперед"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page9.qml")))
    }
}
