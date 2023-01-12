import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {

    property int prevScore: 0
    property int score: 0
    property int achienvement: 0

    property int clicker1Count: 0
    property int clicker2Count: 0
    property int clicker3Count: 0

    onScoreChanged: {
        achienvement += 100
        if (achienvement >= 1000) {
            achienvement = 0
            const object = particles.createObject(this);
        }
        var diff = score - prevScore
        if (diff > 0) {
            const floattt = floatingScore.createObject(scoreLabel);
            floattt.addedVal = diff
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "beige"
    }

    Label {
        id: scoreLabel
        text: score
        y: 250
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 75
    }

    Image {
        id: cookie
        width: 400
        height: width
        anchors.centerIn: parent
        source: "../images/cookie.svg"
        z: 100

        MouseArea {
            anchors.fill: parent

            onClicked: {
                enlarge.start()
                prevScore = score
                score += 100
            }
        }
    }

    Row {
        y: 1000
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30

        Rectangle {
            width: 150
            height: width
            property int cost: 5000
            color: score >= cost ? "lightblue" : "gainsboro"

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 15
                text: "+100"
                font.pixelSize: 20
            }

            Label {
                anchors.centerIn: parent
                font.pixelSize: 60
                text: clicker1Count
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 110
                text: "Cost: " + parent.cost
                font.pixelSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    if (score >= parent.cost) {
                        score -= parent.cost
                        clicker1Count++
                        const object = clicker1Timer.createObject(parent);
                    }
                }
            }
        }

        Rectangle {
            width: 150
            height: width
            property int cost: 10000
            color: score >= cost ? "darksalmon" : "gainsboro"

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 15
                text: "+500"
                font.pixelSize: 20
            }

            Label {
                anchors.centerIn: parent
                font.pixelSize: 60
                text: clicker2Count
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 110
                text: "Cost: " + parent.cost
                font.pixelSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    if (score >= parent.cost) {
                        score -= parent.cost
                        clicker2Count++
                        const object = clicker2Timer.createObject(parent);
                    }
                }
            }
        }

        Rectangle {
            width: 150
            height: width
            property int cost: 20000
            color: score >= cost ? "palegreen" : "gainsboro"

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 15
                text: "+1000"
                font.pixelSize: 20
            }

            Label {
                anchors.centerIn: parent
                font.pixelSize: 60
                text: clicker3Count
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 110
                text: "Cost: " + parent.cost
                font.pixelSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    if (score >= parent.cost) {
                        score -= parent.cost
                        clicker3Count++
                        const object = clicker3Timer.createObject(parent);
                    }
                }
            }
        }
    }

    Component {
        id: clicker1Timer
        Timer {
            running: true
            repeat: true
            interval: 1000
            onTriggered: {
                enlarge.start()
                prevScore = score
                score += 100
            }
        }
    }

    Component {
        id: clicker2Timer
        Timer {
            running: true
            repeat: true
            interval: 1000
            onTriggered: {
                enlarge.start()
                prevScore = score
                score += 500
            }
        }
    }

    Component {
        id: clicker3Timer
        Timer {
            running: true
            repeat: true
            interval: 1000
            onTriggered: {
                enlarge.start()
                prevScore = score
                score += 1000
            }
        }
    }

    Component {
        id: particles
        Item {
            z: 1
            id: container
            anchors.centerIn: parent
            ParticleSystem { id: particleSystem }
            Emitter {
                system: particleSystem
                width: 10
                height: 10
                emitRate: 3000
                maximumEmitted: 100
                lifeSpan: 1000
                velocity: TargetDirection {
                    targetX: 0
                    targetY: 0
                    targetVariation: 360
                    magnitude: 300
                }
            }
            ItemParticle {
                system: particleSystem
                delegate: Rectangle {
                    property int particleSize: 20
                    width: particleSize
                    height: particleSize
                    color: "orange"
                    radius: particleSize/2
                }
            }
            Timer {
                interval: 1000
                running: true
                onTriggered: container.destroy();
            }
        }
    }

    Component {
        id: floatingScore
        Item {
            id: cont
            property int addedVal: 0
            width: 100
            height: width
            anchors.centerIn: parent
            Label {
                id: lbl
                font.pixelSize: 40
                text: "+" + addedVal
                anchors.horizontalCenter: parent.horizontalCenter
            }
            ParallelAnimation {
                running: true
                PropertyAnimation {
                    target: lbl
                    properties: "y"
                    from: -20
                    to: -130
                    duration: 300
                }
                PropertyAnimation {
                    target: lbl
                    properties: "opacity"
                    from: 1.0
                    to: 0.0
                    duration: 300
                }
                onStopped: cont.destroy()
            }
        }
    }

    RotationAnimation {
        target: cookie
        from: 0
        to: 360
        running: true
        onStopped: start()
        duration: 4000
    }

    PropertyAnimation {
        id: enlarge
        target: cookie
        property: "scale"
        from: 1
        to: 1.2
        duration: 100
        onStopped: shrink.start()
    }

    PropertyAnimation {
        id: shrink
        target: cookie
        property: "scale"
        from: 1.2
        to: 1
        duration: 150
    }
}
