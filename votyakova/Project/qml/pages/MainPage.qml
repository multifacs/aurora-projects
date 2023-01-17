
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {

        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        width: parent.width

        Label {
            text: "Рандомный чат"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TextField {
            text: nickname
            placeholderText: "Никнейм"
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        SilicaFlickable {
            width: parent.width
            height: parent.width / 2

            SlideshowView {
                id: view
                anchors.centerIn: parent
                height: parent.width / 3
                width: parent.width
                itemHeight: width / 3; itemWidth: width / 3;
                model: 5
                delegate: Image {
                    width: parent.width / 3
                    height: width
                    source: modelData["avatar"]
                }
                onCurrentItemChanged: avatar = view.currentItem.source
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Начать"
            onClicked: pageStack.push(Qt.resolvedUrl("PickPage.qml"))
        }
    }

    Component.onCompleted: {
        chats = {}

        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://reqres.in/api/users?page=1');
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log(xhr.responseText)
                var resp = JSON.parse(xhr.responseText).data
                view.model = resp
                for (var i = 0; i < resp.length; i++) console.log(resp[i]["avatar"])
            }
        }
    }
}
