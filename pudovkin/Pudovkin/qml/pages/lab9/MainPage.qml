/*******************************************************************************
**
** Copyright (C) 2022 ru.lab
**
** This file is part of the My Aurora OS Application project.
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
        objectName: ""
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }

    Column {
        anchors.centerIn: parent;
        spacing: 20;
        Button {
            text: "1. Дом"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("CanvasHouse.qml")))
        }

        Button {
            text: "2. Анимация"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Sprite.qml")))
        }

        Button {
            text: "3. Нажатия"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Tap.qml")))
        }

        Button {
            text: "4. Фонтан"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Fountain.qml")))
        }

        Button {
            text: "5. Аудио"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("AudioPlayer.qml")))
        }

        Button {
            text: "6. Видео"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("VideoPlayer.qml")))
        }

        Button {
            text: "7. Загрузка"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Load.qml")))
        }
    }
}
