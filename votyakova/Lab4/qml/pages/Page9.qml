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

    PageHeader {
        objectName: "pageHeader"
        title: "Задание 9"
    }

    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: "1232"
                onClicked: field.text = text
            }
            MenuItem {
                text: "1235"
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
        text: "Поле"
        anchors.centerIn: parent
    }

    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "123"
                onClicked: field.text = text
            }
            MenuItem {
                text: "456"
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

    Button {
        anchors.left: parent.left
        y: 1100
        width: 160
        text: "Назад"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page8.qml")))
    }
    Button {
        anchors.right: parent.right
        y: 1100
        width: 160
        text: "Вперед"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page10.qml")))
    }
}
