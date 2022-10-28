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
import QtQuick.LocalStorage 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 6")
    }

    property var db: LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000)

    Column {
        y: 100
        width: parent.width

        TextField {
            id: txtfield
            placeholderText: "Текст заметка"
        }

        Button {
            text: "Добавить"
            onClicked: {
                db.transaction(function(tx) {
                    tx.executeSql("INSERT INTO notes (note_text) VALUES(?);", [txtfield.text]);

                    // Show all added greetings
                    var rs = tx.executeSql('SELECT * FROM notes');

                    var r = []
                    for (var i = 0; i < rs.rows.length; i++) {
                        r.push(rs.rows.item(i))
                    }
                    console.log(r)
                    container.notesModel = r
                });

            }
        }
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.5

        property var notesModel: []

        SilicaListView {
            anchors.fill: parent
            model: container.notesModel
            delegate: Label {
                width: parent.width
                height: 100
                Text {
                    text: modelData.note_text
                    anchors.centerIn: parent
                }
            }
            spacing: 5
        }

        function findGreetings() {
            db.transaction(
                function(tx) {
                    // Create the database if it doesn't already exist
                    tx.executeSql('CREATE TABLE IF NOT EXISTS notes(note_text TEXT)');

                    // Add (another) greeting row
                    tx.executeSql('INSERT INTO notes VALUES(?)', [ 'hello' ]);

                    // Show all added greetings
                    var rs = tx.executeSql('SELECT * FROM notes');

                    var r = []
                    for (var i = 0; i < rs.rows.length; i++) {
                        r.push(rs.rows.item(i))
                    }
                    console.log(r)
                    container.notesModel = r
                }
            )
        }
        Component.onCompleted: findGreetings()
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 20

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task7.qml")))
        }
    }
}
