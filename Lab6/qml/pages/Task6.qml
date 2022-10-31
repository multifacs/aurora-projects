import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 6")
    }

    Column {
        anchors.centerIn: parent
        Row {
            anchors.centerIn: parent.Center
            spacing: 5

            id: row
            property int count: 0

            MyCounter {
                num: parseInt(row.count / 60 / 60)
            }
            MyCounter {
                num: parseInt(row.count / 60)
            }
            MyCounter {
                num: row.count % 60
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 100
            text: "Старт"
            onClicked: {
                timer.running = !timer.running
                console.log(text)
                text = text === "Старт" ? "Пауза" : "Старт"
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            row.count++
        }
    }


    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 20

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
