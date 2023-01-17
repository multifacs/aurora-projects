
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    property string category: "happiness"

    Column {
        anchors.centerIn: parent
        spacing: 100

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                source: personAvatar
                width: 150
                height: width
            }

            Label {
                text: personName
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
                model: chats[personName]
                delegate: Label {
                    text: modelData
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
        }

        Column {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: msgField
                width: 500
                text: ""
                placeholderText: "Введите сообщение"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                text: "Send"
                onClicked: {
                    if (msgField.text != "") {
                        chats[personName].push(msgField.text)
                        view.model = chats[personName]

                        timer.start()
                    }
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    function getMessage() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://api.api-ninjas.com/v1/quotes?category=' + category);
        xhr.setRequestHeader('X-Api-Key', '9KbxFJmO/K59oxlzWjhR5g==m6l9MGG3z43Eyv2W')
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log(xhr.responseText)
                var resp = JSON.parse(xhr.responseText)[0].quote

                chats[personName].push(resp)
                view.model = chats[personName]
            }
        }
    }

    Timer {
        interval: 1000
        repeat: false
        id: timer
        onTriggered: {
            getMessage()
        }
    }
}
