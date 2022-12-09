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
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: -190

            Item {
                width: 400
                height: width

                Canvas {
                    id: canvas1
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        var centreX = width / 2;
                        var centreY = height / 2;

                        ctx.beginPath();
                        ctx.fillStyle = "yellow";
                        ctx.moveTo(centreX, centreY);
                        ctx.arc(centreX, centreY, width / 4, Math.PI * 0, Math.PI * 2, false);
                        ctx.lineTo(centreX, centreY);
                        ctx.fill();

                        ctx.beginPath();
                        ctx.fillStyle = "black";
                        ctx.moveTo(centreX, centreY);
                        ctx.arc(centreX, centreY, width / 4, - Math.PI * 0.5, Math.PI * (2 / 12 * parseInt(row.count / 1000 / 60 % 12) - 0.5), false);
                        ctx.lineTo(centreX, centreY);
                        ctx.fill();
                    }
                }
            }
            Item {
                width: 400
                height: width

                Canvas {
                    id: canvas2
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        var centreX = width / 2;
                        var centreY = height / 2;

                        ctx.beginPath();
                        ctx.fillStyle = "red";
                        ctx.moveTo(centreX, centreY);
                        ctx.arc(centreX, centreY, width / 4, Math.PI * 0, Math.PI * 2, false);
                        ctx.lineTo(centreX, centreY);
                        ctx.fill();

                        ctx.beginPath();
                        ctx.fillStyle = "black";
                        ctx.moveTo(centreX, centreY);
                        ctx.arc(centreX, centreY, width / 4, - Math.PI * 0.5, Math.PI * (2 / 60 * parseInt(row.count / 1000 % 60) - 0.5), false);
                        ctx.lineTo(centreX, centreY);
                        ctx.fill();
                    }
                }
            }
        }

        Row {
            anchors.centerIn: parent.Center
            spacing: 5

            id: row
            property int count: 0

            Secundomer {
                num: parseInt(row.count / 1000 / 60)
                onNumChanged: {
                    canvas1.requestPaint()
                }
            }
            Secundomer {
                num: parseInt(row.count / 1000 % 60)
                onNumChanged: {
                    canvas2.requestPaint()
                }
            }
            Secundomer {
                num: parseInt(row.count % 1000)
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 100
            text: "Старт"
            onClicked: {
                var time = parseInt(row.count / 100 / 60) + ":" + parseInt(row.count / 100 % 60) + ":" + parseInt(row.count % 100)
                timer.running = !timer.running
                // console.log(text === "Старт" ? "Старт " + time : "Стоп " + time)
                timeModel.append({ time: text === "Старт" ? "Старт " + time : "Стоп " + time })
                text = text === "Старт" ? "Стоп" : "Старт"
            }
        }

//        SilicaListView {
//            width: parent.width
//            height: 400
//            model: timeModel

//            delegate: Text {
//                text: time
//            }

//            spacing: 5
//        }

    }

    ListModel {
        id: timeModel
    }

    Timer {
        id: timer
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            row.count += 18
            // console.log(row.count)
        }
    }


    Button {
        text: "<"
        onClicked: pageStack.pop()
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
}
