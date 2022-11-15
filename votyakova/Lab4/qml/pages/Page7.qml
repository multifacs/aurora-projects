import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: "Задание 7"
    }

    Item {
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.7
        SilicaWebView {
            anchors.fill: parent
            url: "https://www.google.com"
        }
    }

    Button {
        anchors.left: parent.left
        y: 1000
        width: 160
        text: "Назад"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page6.qml")))
    }
    Button {
        anchors.right: parent.right
        y: 1000
        width: 160
        text: "Вперед"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page8.qml")))
    }
}
