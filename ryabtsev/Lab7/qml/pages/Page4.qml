/*******************************************************************************
**
** Copyright (C) 2022 Open Mobile Platform LLC.
** Contact: https://community.omprussia.ru/open-source
**
** This file is part of the Aurora OS Application Template project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        PushUpMenu {
            MenuItem {
                text: "Задание 1"
                onClicked: pageStack.push(Qt.resolvedUrl("Page1.qml"))
            }
            MenuItem {
                text: "Задание 2"
                onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
            }
            MenuItem {
                text: "Задание 3"
                onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
            }
            MenuItem {
                text: "Задание 5"
                onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
            }
        }

        anchors.fill: parent

        Column {
            anchors.centerIn: parent
            spacing: circleWidth / 10

            property int circleWidth: 100
            property int delayCnt: 0

            TrafficLight {
                id: redCircle
                color: "red"
            }
            TrafficLight {
                id: yellowCircle
                color: "yellow"
            }
            TrafficLight {
                id: greenCircle
                color: "green"
            }

            Timer {
                interval: 100; running: true; repeat: true
                onTriggered: parent.delayCnt = (parent.delayCnt + 1) % 40
            }

            state: {
                if (delayCnt < 10){
                    "red"
                } else if (delayCnt < 20) {
                    "yellow_red"
                } else if (delayCnt < 30) {
                    "green"
                } else {
                    "yellow_green"
                }
            }

            states: [
                State {
                    name: "red"
                    StateChangeScript {
                        script: {
                            redCircle.opacity = 1
                            yellowCircle.opacity = 0.3
                            greenCircle.opacity = 0.3
                        }
                    }
                },
                State {
                    name: "yellow_red"
                    StateChangeScript {
                        script: {
                            redCircle.opacity = 1
                            yellowCircle.opacity = 1
                            greenCircle.opacity = 0.3
                        }
                    }
                },
                State {
                    name: "green"
                    StateChangeScript {
                        script: {
                            redCircle.opacity = 0.3
                            yellowCircle.opacity = 0.3
                            greenCircle.opacity = 1
                        }
                    }
                },
                State {
                    name: "yellow_green"
                    StateChangeScript {
                        script: {
                            redCircle.opacity = 0.3
                            yellowCircle.opacity = 1
                            greenCircle.opacity = 1
                        }
                    }
                }
            ]
        }
    }
}
