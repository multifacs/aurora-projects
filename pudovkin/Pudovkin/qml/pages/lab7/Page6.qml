import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "Секундомер из своего компонента"
        title: "ContextMenu"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

    Column {
        anchors.centerIn: parent

        Item {
            width: 400
            height: width
            anchors.horizontalCenter: parent.horizontalCenter

            Canvas {
                id: canvas
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    var centreX = width / 2;
                    var centreY = height / 2;

                    ctx.beginPath();
                    ctx.fillStyle = "black";
                    ctx.moveTo(centreX, centreY);
                    ctx.arc(centreX, centreY, width / 2, Math.PI * 0, Math.PI * 2, false);
                    ctx.lineTo(centreX, centreY);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "red";
                    ctx.moveTo(centreX, centreY);
                    ctx.arc(centreX, centreY, width / 2, - Math.PI * 0.5, Math.PI * (2 / 60 * parseInt(row.count % 60) - 0.5), false);
                    ctx.lineTo(centreX, centreY);
                    ctx.fill();

                    ctx.beginPath();
                    ctx.fillStyle = "black";
                    ctx.moveTo(centreX, centreY);
                    ctx.arc(centreX, centreY, width / 2.5, 0, Math.PI * 2, false);
                    ctx.lineTo(centreX, centreY);
                    ctx.fill();
                }

                Label {
                    anchors.centerIn: parent
                    text: parseInt(row.count / 60 / 60) + ":" + parseInt(row.count / 60) + ":" + row.count % 60
                    color: "white"
                    font.bold: true
                }
            }
        }

        Row {
            anchors.centerIn: parent.Center
            spacing: 5

            id: row
            property int count: 0
            visible: false

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
            canvas.requestPaint()
        }
    }
}
