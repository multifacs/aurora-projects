import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Кликер"
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

    Label {
        property int count: 1
        id: counter
        text: count
        anchors.centerIn: parent
        bottomPadding: 10
        font.pixelSize: 80
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 900
        Button {
            text: "+"
            anchors.horizontalCenter: counter.horizontalCenter
            anchors.top: counter.bottom
            onClicked: {
                counter.count++
            }
        }
    }
}
