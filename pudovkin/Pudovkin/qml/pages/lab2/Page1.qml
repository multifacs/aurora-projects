import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 2, задание 1"
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

    Label {
        property int count: 1
        property int count2: 0
        id: counter
        text: count + " ; " + count2
        anchors.centerIn: parent
        bottomPadding: 10
        font.pixelSize: 100
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 900
        Button {
            text: "Прибавить"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {

                counter.count2 = counter.count
                counter.count++
            }
        }

        Button {
            text: "Обнулить"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                counter.count2 = 0
                counter.count = 0
            }
        }

        Button {
            text: "Фибоначчи"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var x = counter.count2
                counter.count2 = counter.count
                counter.count += x
            }
        }
    }
}
