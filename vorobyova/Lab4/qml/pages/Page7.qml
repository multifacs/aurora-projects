import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

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
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Задания"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Pages.qml")))
    }
}
