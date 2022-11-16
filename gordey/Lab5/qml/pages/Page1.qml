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
** this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
** this list of conditions and the following disclaimer
** in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
** may be used to endorse or promote products derived from this software
** without specific prior written permission.
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
    ListModel {
        id: rectanglesModel
        ListElement { idx: 1; name: "Белый"; bgcolor: "#ffffff"; txtcolor: "black" }
        ListElement { idx: 2; name: "Синий"; bgcolor: "#0000ff"; txtcolor: "white" }
        ListElement { idx: 3; name: "Черный"; bgcolor: "#000000"; txtcolor: "white" }
    }

    SilicaFlickable {
        PushUpMenu {
            MenuItem {
                text: "Задание 2"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page2.qml"))
            }
            MenuItem {
                text: "Задание 3"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page3.qml"))
            }
            MenuItem {
                text: "Задание 4"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page4.qml"))
            }
            MenuItem {
                text: "Задание 5"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page5.qml"))
            }
            MenuItem {
                text: "Задание 6"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page6.qml"))
            }
            MenuItem {
                text: "Задание 7"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page7.qml"))
            }
            MenuItem {
                text: "Задание 8"
                onClicked: pageStack.replace(Qt.resolvedUrl("Page8.qml"))
            }
        }

        anchors.fill: parent

        Item {
            anchors {
                left: parent.left; right: parent.right;
                verticalCenter: parent.verticalCenter;
            }
            height: parent.height * 0.7

            SilicaListView {
                anchors.fill: parent
                model: rectanglesModel
                delegate: Rectangle {
                    color: bgcolor
                    width: parent.width
                    height: 200
                    Text {
                        text: name
                        anchors.centerIn: parent
                        color: txtcolor
                    }
                }
                spacing: 5
            }
        }
    }
}
