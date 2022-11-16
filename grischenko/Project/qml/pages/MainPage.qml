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
import "."

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Item {
        width: parent.width
        anchors.centerIn: parent
        height: parent.height * 0.7

        ComboBox {
            id: comboBox
            anchors.centerIn: parent
            label: "Выберите месяц"
            description: "Описание выпадающего списка"
            menu: ContextMenu {
                MenuItem { text: "Январь"; }
                MenuItem { text: "Февраль"; }
                MenuItem { text: "Март"; }
                MenuItem { text: "Апрель"; }
                MenuItem { text: "Май"; }
                MenuItem { text: "Июнь"; }
                MenuItem { text: "Июль"; }
                MenuItem { text: "Август"; }
                MenuItem { text: "Сентябрь"; }
                MenuItem { text: "Октябрь"; }
                MenuItem { text: "Ноябрь"; }
                MenuItem { text: "Декабрь"; }
            }
            currentIndex: 9
            onCurrentIndexChanged: {
                console.log(value, currentIndex)
                Store.date.setMonth(currentIndex)
            }
        }
    }

    Button {
        text: "Перейти"
        onClicked: pageStack.push(Qt.resolvedUrl("MonthPage.qml"))
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Component.onCompleted: {
        Store.date.setTime(0)
        Store.date.setFullYear(new Date().getFullYear())
        Store.date.setMonth(new Date().getMonth())
        Store.date.setDate(new Date().getDate())

        comboBox.currentIndex = Store.date.getMonth()

        Store.db.transaction(
            function(tx) {
                // Create the database if it doesn't already exist
                tx.executeSql('DROP TABLE IF EXISTS moods');
                tx.executeSql('CREATE TABLE IF NOT EXISTS moods(date TEXT, mood TEXT)');

                var someDate = new Date()
                someDate.setTime(0)
                someDate.setFullYear(Store.date.getFullYear())
                someDate.setMonth(Store.date.getMonth())
                someDate.setDate(Store.date.getDate())
                someDate = someDate.getTime().toString()

                // Add (another) greeting row
                tx.executeSql('INSERT INTO moods VALUES(?, ?)', [ someDate, "good" ]);

                // Show all added greetings
                var rs = tx.executeSql('SELECT * FROM moods');

                var r = []
                for (var i = 0; i < rs.rows.length; i++) {
                    r.push(rs.rows.item(i))
                }
                console.log(JSON.stringify(r))
                console.log(r[0].date)
                someDate = new Date()
                console.log(someDate)
                someDate.setTime(r[0].date)
                console.log(someDate)
            }
        )
    }
}
