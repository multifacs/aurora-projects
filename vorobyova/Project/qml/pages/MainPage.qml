import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    property int progress1: 0
    property var prog1: progressArc.createObject(progressRow)
    property int progress2: 0
    property var prog2: progressArc.createObject(progressRow)
    property int progress3: 0
    property var prog3: progressArc.createObject(progressRow)

    property bool gameStart: false

    property int userClick: 0
    property int lastId: 0

    property int userScore: 0
    property var currDate: new Date()

    onUserScoreChanged: {
        if (userScore >= 1000) {
            audio.stop()
            prog1.timerRunning = false
            prog2.timerRunning = false
            prog3.timerRunning = false
            var seconds = (new Date().getTime() - currDate.getTime()) / 1000;
            scoreLabel.text = "Время: " + seconds + " сек"
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "orange"
    }

    Column {
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        spacing: 50

        Row {
            id: progressRow
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
        }

        Image {
            source: "../img/map.jpg"
            width: parent.width + 50
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectCrop

            Image {
                source: "../img/1.svg"
                width: 120
                height: 120
                x: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 1) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }

            Image {
                source: "../img/2.svg"
                width: 120
                height: 120
                x: 260
                y: 45
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 2) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }

            Image {
                source: "../img/3.svg"
                width: 120
                height: 120
                x: 460
                y: 60
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 3) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }

            Image {
                source: "../img/4.svg"
                width: 120
                height: 120
                x: 50
                y: 130
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 4) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }

            Image {
                source: "../img/5.svg"
                width: 120
                height: 120
                x: 120
                y: 250
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 5) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }

            Image {
                source: "../img/6.svg"
                width: 120
                height: 120
                x: 525
                y: 250
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (userClick === 6) {
                            userScore += 100

                            if (lastId === prog1.numId) {
                                prog1.timerRunning = true
                            }
                            if (lastId === prog2.numId) {
                                prog2.timerRunning = true
                            }
                            if (lastId === prog3.numId) {
                                prog3.timerRunning = true
                            }
                        }
                    }
                }
            }
        }

        Label {
            id: scoreLabel
            text: userScore
            font.pixelSize: 60
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "play"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {

                if (audio.status != 6) {
                    currDate = new Date()
                    audio.play()
                    prog1.timerRunning = true
                    prog2.timerRunning = true
                    prog3.timerRunning = true
                } else {
                    audio.stop()
                    prog1.timerRunning = false
                    prog2.timerRunning = false
                    prog3.timerRunning = false
                }

                gameStart = !gameStart
            }
        }
    }

    Audio {
        id: audio
        source: "../sound/pizzatheme.mp3"
        volume: 0.3
    }

    Component.onCompleted: {
        prog1.numId = 1
        prog2.numId = 2
        prog3.numId = 3
    }

    onProgress1Changed: {
        prog1.progress = progress1
        prog1.requestPaint()
    }

    Component {
        id: progressArc
        Canvas {
            property int numId: 0
            property int progress: 0
            property int someTime: parseInt(Math.random() * 100 + 50)
            property int someImage: parseInt(Math.random() * 10)
            property int someDestination: parseInt(Math.random() * 6)
            property bool timerRunning: false

            id: canvas
            width: 200
            height: 200
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                var centreX = width / 2;
                var centreY = height / 2;

                ctx.beginPath();
                ctx.fillStyle = "grey";
                ctx.moveTo(centreX, centreY);
                ctx.arc(centreX, centreY, width / 2, Math.PI * 0, Math.PI * 2, false);
                ctx.lineTo(centreX, centreY);
                ctx.fill();

                ctx.beginPath();
                ctx.fillStyle = "lime";
                ctx.moveTo(centreX, centreY);
                ctx.arc(centreX, centreY, width / 2, - Math.PI * 0.5, Math.PI * (2 / 100 * progress - 0.5), false);
                ctx.lineTo(centreX, centreY);
                ctx.fill();
            }

            onProgressChanged: {
                if (progress === 100) {

                    var randPizza = parseInt(Math.random() * 10)
                    someTime = parseInt(Math.random() * 100 + 50)
                    progress = 0
                    timerRunning = false
                    someImage = parseInt(Math.random() * 10)
                    img.visible = true
                } else {
                    img.visible = false
                }
            }

            Image {
                id: img
                source: "../img/" + someImage + ".jpeg"
                anchors.fill: parent
                visible: false

                Image {
                    source: "../img/" + someDestination + ".svg"
                    anchors.fill: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        userClick = someDestination
                        lastId = numId
                    }
                }
            }

            Timer {
                running: timerRunning
                repeat: true
                interval: someTime
                onTriggered: {
                    progress++
                    console.log(progress)
                    canvas.requestPaint()
                }
            }
        }
    }
}
