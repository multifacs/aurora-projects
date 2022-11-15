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
        height: parent.height * 0.8
        SilicaWebView {
            anchors.fill: parent
            url: "https://www.yandex.ru"
        }
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 100
        text: "<"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page6.qml")))
    }
    Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 100
        text: ">"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page8.qml")))
    }
}
