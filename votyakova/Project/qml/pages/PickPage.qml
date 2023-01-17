
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int page: 1

    Column {
        anchors.centerIn: parent
        spacing: 100

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                source: avatar
                width: 150
                height: width
            }

            Label {
                text: nickname
            }
        }

        SilicaFlickable {
            width: parent.width
            height: parent.width

            SilicaListView {
                id: view
                anchors.centerIn: parent
                height: parent.width / 2
                width: parent.width
                anchors.fill: parent
                delegate: ListItem {

                    Row {
                        Image {
                            width: 100
                            height: width
                            source: modelData["avatar"]
                        }

                        Column {
                            Label {
                                text: modelData["first_name"] + " " + modelData["last_name"]
                            }

                            Label {
                                text: modelData["email"]
                                font.pixelSize: 30
                            }
                        }
                    }


                    onClicked: {
                        personName = modelData["first_name"] + " " + modelData["last_name"]
                        personAvatar = modelData["avatar"]

                        if (chats[personName] == undefined) {
                            console.log(chats[personName], "pushed!")
                            chats[personName] = []
                        }

                        pageStack.push(Qt.resolvedUrl("ChatPage.qml"))
                    }
                }
            }

        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                width: 100
                text: "<"
                onClicked: {
                    if (page > 1) {
                        page--
                        loadUsers()
                    }
                }
            }

            Label {
                text: "Страница: " + page
            }

            Button {
                width: 100
                text: ">"
                onClicked: {
                    if (page < 2) {
                        page++
                        loadUsers()
                    }
                }
            }
        }
    }

    function loadUsers() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://reqres.in/api/users?page=' + page);
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var resp = JSON.parse(xhr.responseText).data
                view.model = resp
            }
        }
    }

    Component.onCompleted: {
        loadUsers()
    }
}
