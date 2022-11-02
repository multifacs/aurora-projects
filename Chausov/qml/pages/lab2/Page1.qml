import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Кликер"
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
            anchors.horizontalCenter: counter.horizontalCenter
            anchors.top: counter.bottom
            onClicked: {

                counter.count2 = counter.count
                counter.count++
            }
        }

        Button {
            text: "Обнулить"
            anchors.horizontalCenter: counter.horizontalCenter
            anchors.top: counter.bottom
            onClicked: {
                counter.count2 = 0
                counter.count = 0
            }
        }

        Button {
            text: "Фибоначчи"
            anchors.horizontalCenter: counter.horizontalCenter
            anchors.top: counter.bottom

            onClicked: {
                var x = counter.count2
                counter.count2 = counter.count
                counter.count += x
            }
        }
    }
}
