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

    property int num1: 0
    property int num2: 0
    property double result: 0

    Column {
        spacing: 10
        anchors.centerIn: parent
        Row {
            spacing: 10
            Label {
                id: num1Label
                text: num1
            }
            Label {
                id: num2Label
                text: num2
            }
        }
        Label {
            id: resultLabel
            text: result
        }
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-splus-show-password"
            onTriggered:  {
                num1 = Math.random() * 100
                num2 = Math.random() * 100
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-add"
            onTriggered: result = num1 + num2
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-remove"
            onTriggered: result = num1 - num2
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-clear"
            onTriggered: result = num1 * num2
        }
        CoverAction {
            iconSource: "image://theme/icon-splus-error"
            onTriggered: result = Math.round(num1 / num2 * 100) / 100
        }
    }
}
