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

    function drawNumbers(radius, num) {
        var ang;
        ang =  -num * Math.PI / 6 - 60.2;
        return [radius * Math.sin(ang), radius * Math.cos(ang)]
    }

    function drawNumbersMin(radius, num) {
        var ang;
        ang =  -num * Math.PI / 36 - 60.2;
        return [radius * Math.sin(ang), radius * Math.cos(ang)]
    }

    Column {
        anchors.centerIn: parent
        spacing: 100

        Rectangle {
            id: clock
            width: 300
            height: width
            radius: width / 2
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: 12
                Label {
                    text: index + 1
                    x: 150 - width / 2 + drawNumbers(120, index)[0]
                    y: 150 - height / 2 + drawNumbers(120, index)[1]
                }
            }

            Rectangle {
                id: minuteArm
                width: 10
                height: 10
                color: "green"
                x: 150 - width / 2 + drawNumbersMin(90, parseInt(row.count / 1000 % 60) - 5)[0]
                y: 150 - height / 2 + drawNumbersMin(90, parseInt(row.count / 1000 % 60) - 5)[1]
            }

            Rectangle {
                id: hourArm
                width: 5
                height: 5
                color: "red"
                x: 150 - width / 2 + drawNumbers(90, parseInt(row.count / 1000 / 60) % 12 - 1)[0]
                y: 150 - height / 2 + drawNumbers(90, parseInt(row.count / 1000 / 60) % 12 - 1)[1]
            }
        }

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
