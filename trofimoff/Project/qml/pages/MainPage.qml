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
    Column {
        anchors.centerIn: parent
        spacing: 100
        id: column

        Label {
            id: announcement
            text: "Вы играете за крестки"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Grid {
            id: grid
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 3
            spacing: 10
            Button {
                id: cell1
                property int num: 1
                width: 100
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell2
                property int num: 2
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell3
                property int num: 3
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell4
                property int num: 4
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell5
                property int num: 5
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell6
                property int num: 6
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell7
                property int num: 7
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell8
                property int num: 8
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
            Button {
                id: cell9
                property int num: 9
                width: cell1.width
                height: width
                onClicked: parent.parent.move(this)
                text: ""
            }
        }

        Button {
            id: restartBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Перезапуск"
            onClicked: {
                for (var i = 0; i < 9; i++) {
                    grid.children[i].text = ""
                }
                announcement.text = "Вы играете за крестики"
            }
        }

        Timer {
            id: timer
            interval: 1000
            running: false
            repeat: false
            onTriggered: {
                var rand = parseInt(Math.random() * 9)
                console.log(rand)
                if (grid.children[rand].text !== "") {
                    timer.restart()
                } else {
                    grid.children[rand].text = "-"
                }
                column.checkWinPc()
            }
        }

        function move(button) {
            console.log(button.num)
            if (button.text === "") {
                button.text = "x"
                timer.start()
            }
            column.checkWinYou()
        }

        function checkWinYou() {
            var count = 0
            for (var i = 0; i < 3; i++) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 3; i < 6; i++) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 6; i < 9; i++) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 0; i < 7; i+=3) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 1; i < 8; i+=3) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 2; i < 9; i+=3) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 0; i < 9; i+=4) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }

            count = 0
            for (i = 2; i < 7; i+=2) {
                if (grid.children[i].text === "x") count++
            }
            if (count === 3) {
                announcement.text = "Вы победили"
                timer.stop()
            }
        }

        function checkWinPc() {
            var count = 0
            for (var i = 0; i < 3; i++) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 3; i < 6; i++) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 6; i < 9; i++) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 0; i < 7; i+=3) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 1; i < 8; i+=3) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 2; i < 9; i+=3) {
                if (grid.children[i].text === "-") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 0; i < 9; i+=4) {
                if (grid.children[i].text === "+") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 2; i < 7; i+=2) {
                if (grid.children[i].text === "+") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            count = 0
            for (i = 0; i < 9; i+=1) {
                if (grid.children[i].text !== "") count++
            }
            if (count === 3) announcement.text = "Вы проиграли"

            if (count === 9 && announcement.text === "Вы играете за крестики") {
                announcement.text = "Ничья"
            }
        }
    }
}
