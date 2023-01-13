import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Toggle"
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

    Button {
        anchors.centerIn: parent
        property bool toggle: false
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Залипание"
        down: toggle
        onClicked: toggle = !toggle
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
