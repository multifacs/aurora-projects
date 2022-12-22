import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {
    Component {
        id: particles
        Item {
            id: container
            width: 200
            height: 200
            ParticleSystem { id: particleSystem }
            Emitter {
                system: particleSystem
                width: 10
                height: 10
                emitRate: 1000
                maximumEmitted: 100
                lifeSpan: 1000
                velocity: TargetDirection {
                    targetX: 0
                    targetY: 0
                    targetVariation: 360
                    magnitude: 100
                }
            }
            ItemParticle {
                system: particleSystem
                delegate: Rectangle {
                    property int particleSize: 7
                    width: particleSize
                    height: particleSize
                    color: Theme.highlightColor
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

    MouseArea {
        anchors.fill: parent
        onClicked: {
            const object = particles.createObject(parent);
            object.x = mouseX
            object.y = mouseY
        }
    }
}
