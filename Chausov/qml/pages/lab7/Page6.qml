import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 7, задание 6"
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
    Column {
            anchors.centerIn: parent
            Row {
                anchors.centerIn: parent.Center
                spacing: 5

                id: row
                property int count: 0

                MyCounter {
                    num: parseInt(row.count / 1000 / 60)
                }
                MyCounter {
                    num: parseInt(row.count / 1000 % 60)
                }
                MyCounter {
                    num: parseInt(row.count % 1000)
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 100
                text: "Старт"
                onClicked: {
                    timer.running = !timer.running
                    text = text === "Старт" ? "Стоп" : "Старт"
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 100
                text: "Время"
                onClicked: {
                    var time = parseInt(row.count / 1000 / 60) + "-" + parseInt(row.count / 1000 % 60) + "-" + parseInt(row.count % 1000)
                    timeModel.append({ time: time })
                }
            }

            SilicaListView {

                width: parent.width
                height: 400
                model: timeModel

                delegate: Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: time
                    font.pixelSize: 35
                }

                spacing: 5
            }

        }

        ListModel {
            id: timeModel
        }

        Timer {
            id: timer
            interval: 1
            repeat: true
            running: false
            onTriggered: {
                row.count++
            }
        }
}
