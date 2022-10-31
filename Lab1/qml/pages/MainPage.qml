import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Кликер"
    }

    Label {
        property int count: 0
        id: counter
        text: count
        anchors.centerIn: parent
        bottomPadding: 10
        font.pixelSize: 100
    }

    Button {
        text: "Клик!"
        anchors.horizontalCenter: counter.horizontalCenter
        anchors.top: counter.bottom
        onClicked: counter.count++
    }
}
