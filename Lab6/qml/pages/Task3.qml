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
** ARISING IN ANY start OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 3")
    }

    Label {
        id: tgt
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        text: "Текст"
        color: "teal"
        font.pixelSize: 150
        horizontalAlignment: Text.AlignHCenter
    }

    state: {
        if (mouseArea.pressedButtons){
            "start"
        } else {
            "finish"
        }
    }

    states: [
        State {
            name: "start"
        },
        State {
            name: "finish"
        }
    ]

    transitions: [
        Transition {
            from: "finish"
            to: "start"
            ParallelAnimation {
                PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 800; duration: 900;}
                PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "white"; duration: 900;}
                RotationAnimation { target: tgt; from: 0; to: 180; duration: 900;}
            }
        },
        Transition {
            from: "start"
            to: "finish"
            PropertyAnimation { target: tgt; properties: "y"; from: tgt.y; to: 200; duration: 900}
            PropertyAnimation { target: tgt; properties: "color"; from: tgt.color; to: "teal"; duration: 900;}
            RotationAnimation { target: tgt; from: tgt.rotation; to: 0; duration: 900;}

        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
