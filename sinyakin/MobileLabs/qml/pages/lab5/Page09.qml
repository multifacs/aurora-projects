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

    PageHeader {
        objectName: "pageHeader"
        title: "Pull menus"
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

    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: "Текст 1"
                onClicked: field.text = text
            }
            MenuItem {
                text: "Текст 2"
                onClicked: field.text = text
            }
            MenuLabel { text: "Надпись" }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.1
        y: parent.height * 0.1
        header: PageHeader { title: "Список 1" }
    }

    TextField {
        id: field
        text: "Здесь будет текст"
        anchors.centerIn: parent
    }

    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "Текст 3"
                onClicked: field.text = text
            }
            MenuItem {
                text: "Текст 4"
                onClicked: field.text = text
            }
            MenuLabel { text: "Надпись" }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.1
        y: parent.height * 0.75
        header: PageHeader { title: "Список 2" }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page10.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
