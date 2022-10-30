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

        Label {
            text: "Игра началась"
            anchors.horizontalCenter: parent.horizontalCenter
            id: label
        }

        Grid {
            id: grid
            columns: 4
            anchors.horizontalCenter: parent.horizontalCenter
            width: cell1.width * 4 + spacing * 3
            height: width
            spacing: 5

            Cell {
                id: cell1
                num: 0
            }
            Cell {
                num: 1
            }
            Cell {
                num: 2
            }
            Cell {
                num: 3
            }
            Cell {
                num: 4
            }
            Cell {
                num: 5
            }
            Cell {
                num: 6
            }
            Cell {
                num: 7
            }
            Cell {
                num: 8
            }
            Cell {
                num: 9
            }
            Cell {
                num: 10
            }
            Cell {
                num: 11
            }
            Cell {
                num: 12
            }
            Cell {
                num: 13
            }
            Cell {
                num: 14
            }
            Cell {
                num: 15
            }

            function move(num, pc) {
                // var id = cell.num
                // console.log(num)
                var cellToActivate = -1
                for (var i = num; i < 16 && i <= num + 12; i += 4) {
                    console.log(i)
                    if (!grid.children[i].active) cellToActivate = i
                }
                if (cellToActivate !== -1) {
                    grid.children[cellToActivate].active = true
                    if (!pc) grid.children[cellToActivate].color = "red"
                    if (pc) grid.children[cellToActivate].color = "orange"
                }
                grid.checkWinYou()
            }

            function reset() {
                for (var i = 0; i < 16; i++) {
                    grid.children[i].active = false
                }
                label.text = "Игра началась"
            }

            function pcMove() {
                var cellRnd = parseInt(Math.random() * 15)
                if (!grid.children[cellRnd].active) {
                    move(cellRnd, true)
                } else {
                    timer.start()
                }
            }

            function checkWinYou() {
                var count = 0
                var i = 0
                var j = 0

                for (j = 0; j < 4; j++) {
                    for (i = j * 4; i < j * 4 + 4; i++) {
                        if (grid.children[i].active && grid.children[i].color === "red") {
                            count++
                        } else {
                            if (i !== j * 4 && i !== j * 4 - 1) break
                        }
                    }
                    if (count === 3) {
                        label.text = "Победа"
                        timer.stop()
                    }
                    count = 0
                }

                for (j = 0; j < 4; j++) {
                    for (i = j; i <= j + 4 * 3; i+=4) {
                        if (grid.children[i].active && grid.children[i].color === "red") {
                            count++
                        } else {
                            if (i !== j && i !== j + 4 * 3) break
                        }
                    }
                    if (count === 3) {
                        label.text = "Победа"
                        timer.stop()
                    }
                    count = 0
                }

                for (i = 0; i <= 15; i+=5) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    } else {
                        if (i !== 0 && i !== 15) break
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0

                for (i = 3; i <= 12; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    } else {
                        if (i !== 3 && i !== 12) break
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0

                for (i = 2; i <= 8; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0

                for (i = 7; i <= 13; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0

                for (i = 4; i <= 14; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0

                for (i = 1; i <= 11; i+=5) {
                    if (grid.children[i].active && grid.children[i].color === "red") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Победа"
                    timer.stop()
                }
                count = 0
            }

            function checkWinPc() {
                console.log("pc")
                var count = 0
                var i = 0
                var j = 0

                for (j = 0; j < 4; j++) {
                    for (i = j * 4; i < j * 4 + 4; i++) {
                        if (grid.children[i].active && grid.children[i].color === "orange") {
                            count++
                        } else {
                            if (i !== j * 4 && i !== j * 4 - 1) break
                        }
                    }
                    if (count === 3) {
                        label.text = "Поражение"
                        timer.stop()
                    }
                    count = 0
                }

                for (j = 0; j < 4; j++) {
                    for (i = j; i <= j + 4 * 3; i+=4) {
                        if (grid.children[i].active && grid.children[i].color === "orange") {
                            count++
                        } else {
                            if (i !== j && i !== j + 4 * 3) break
                        }
                    }
                    if (count === 3) {
                        label.text = "Поражение"
                        timer.stop()
                    }
                    count = 0
                }

                for (j = 0; j < 4; j++) {
                    for (i = j; i <= j + 4 * 3; i+=4) {
                        if (grid.children[i].active && grid.children[i].color === "orange") {
                            count++
                        } else {
                            if (i !== j && i !== j + 4 * 3) break
                        }
                    }
                    if (count === 3) {
                        label.text = "Поражение"
                        timer.stop()
                    }
                    count = 0
                }

                for (i = 0; i <= 15; i+=5) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    } else {
                        if (i !== 0 && i !== 15) break
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0

                for (i = 3; i <= 12; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    } else {
                        if (i !== 3 && i !== 12) break
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0

                for (i = 2; i <= 8; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0

                for (i = 7; i <= 13; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0

                for (i = 4; i <= 14; i+=3) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0

                for (i = 1; i <= 11; i+=5) {
                    if (grid.children[i].active && grid.children[i].color === "orange") {
                        count++
                    }
                }
                if (count === 3) {
                    label.text = "Поражение"
                    timer.stop()
                }
                count = 0
            }
        }

        Button {
            text: "Reset"
            onClicked: grid.reset()
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Timer {
            id: timer
            interval: 500
            onTriggered: if (label.text !== "Победа") {
                             grid.pcMove()
                             grid.checkWinPc()
                         }
        }
    }
}
