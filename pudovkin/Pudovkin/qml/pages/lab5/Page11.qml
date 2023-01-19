import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    property var urls: [
        "https://google.com",
        "https://yandex.ru",
        "https://unn.ru"
    ]
    property string pickedUrl
    property var currentComponent

    PageHeader {
        objectName: "pageHeader"
        title: "Switch"
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

    SilicaFlickable {
        anchors.fill: parent

        SilicaListView {
            model: urls
            anchors.centerIn: parent
            width: parent.width
            height: 500

            delegate: ListItem {
                Label {
                    text: modelData
                }
                onClicked: {
                    pickedUrl = modelData
                    currentComponent = webComponent.createObject(webContainer)
                    dialog.open()
                }
            }
        }
    }

    Dialog {
        id: dialog
        Column {
            anchors.fill: parent
            spacing: Theme.paddingMedium
            DialogHeader { }


            Item {
                width: parent.width
                height: parent.height * 0.8
                id: webContainer
            }
        }
        onAccepted: currentComponent.destroy()
        onCanceled: currentComponent.destroy()
    }

    Component {
        id: webComponent
        SilicaWebView {
            url: pickedUrl
            anchors.fill: parent
        }
    }
}
