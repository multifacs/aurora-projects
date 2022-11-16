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

CoverBackground {
    objectName: "defaultCover"

    property int counter: 0
    property int rand1: 0
    property int rand2: 0

    Column {
        anchors.centerIn: parent
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 100

            Label {
                id: label2
                text: rand1
            }

            Label {
                id: label3
                text: rand2
            }
        }

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Счётчик: %1").arg(counter)
        }

        Label {
            id: label4
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-splus-error"
            onTriggered: {
                counter++
                rand1 = parseInt(Math.random() * 10)
                rand2 = parseInt(Math.random() * 10)
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-add"
            onTriggered: label4.text = rand1 + rand2
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-remove"
            onTriggered: {
                label4.text = rand1 - rand2
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-s-clear-opaque-cross"
            onTriggered: label4.text = rand1 * rand2
        }
        CoverAction {
            iconSource: "image://theme/icon-s-edit"
            onTriggered: {
                if (rand2 !== 0) label4.text = rand1 / rand2
            }
        }
    }
}
