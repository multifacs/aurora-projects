import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

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
                ListElement { desc: "Дело 1"; date: "5.10.22"; }
                ListElement { desc: "Дело 2"; date: "7.10.22"; }
                ListElement { desc: "Дело 3"; date: "10.10.22"; }
                ListElement { desc: "Дело 4"; date: "10.10.22"; }
            }
            delegate: Rectangle {
                width: view.itemWidth;
                height: view.itemHeight;
                color: "lightblue"
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
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
