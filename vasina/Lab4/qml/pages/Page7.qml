import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

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
        x: 100
        y: 1100
        width: 160
        text: "Пред"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page6.qml")))
    }
    Button {
        x: 500
        y: 1100
        width: 160
        text: "След"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page8.qml")))
    }
}
