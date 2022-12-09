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
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 6")
    }

    Column {
        anchors.centerIn: parent
        spacing: 100
        Row {
            anchors.centerIn: parent.Center
            spacing: 5

            id: row
            property int count: 0

            MyCounter {
                num: parseInt(row.count / 1000 / 60 / 60)
            }
            MyCounter {
                num: parseInt(row.count / 1000 / 60)
            }
            MyCounter {
                num: parseInt(row.count / 1000 % 60)
            }
            MyCounter {
                num: row.count % 1000
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 100
            text: "Старт"
            onClicked: {
                timer.running = !timer.running
                timerRunning = !timerRunning
                console.log(text)
                text = text === "Старт" ? "Пауза" : "Старт"
            }
        }
    }

    Timer {
        id: timer
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            row.count += 30
        }
    }


    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Задания"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
