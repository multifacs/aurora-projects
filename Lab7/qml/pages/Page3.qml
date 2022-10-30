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
                text: "Задание 4"
                onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
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

        Label {
            id: tgt
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "Hello"
            color: "blue"
            font.pixelSize: 200
            horizontalAlignment: Text.AlignHCenter
        }

        state: {
            if (mouseArea.pressedButtons){
                "way"
            } else {
                "back"
            }
        }

        states: [
            State {
                name: "way"
            },
            State {
                name: "back"
            }
        ]

        transitions: [
            Transition {
                from: "back"
                to: "way"
                ParallelAnimation {
                    PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 800; duration: 1000;}
                    PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "white"; duration: 1000;}
                    RotationAnimation { target: tgt; from: 0; to: 180; duration: 1000;}
                }
            },
            Transition {
                from: "way"
                to: "back"
                PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 100; duration: 1000}
                PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "blue"; duration: 1000;}
                RotationAnimation { target: tgt; from: tgt.rotation; to: 0; duration: 1000;}

            }
        ]

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            onPressed: {
                console.log("123")
                console.log(mouseArea.pressedButtons)
            }
            onReleased: {
                console.log(mouseArea.pressedButtons)
            }
        }
    }
}
