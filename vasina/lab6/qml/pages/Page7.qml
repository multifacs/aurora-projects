import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    id: page
    allowedOrientations: Orientation.All
    PageHeader { title: " " }
    property int prevDepth: 2
    property int pushPage: 0
    property int popPage: 0

    function check() {
        if (typeof pageStack === "undefined")
            return
        if (prevDepth > pageStack.depth)
            popPage++;
        else if (prevDepth < pageStack.depth)
            pushPage++;
        prevDepth = pageStack.depth;
    }

    Component.onCompleted: {
        pageStack.depthChanged.connect(check);
    }

    Column {
        anchors.fill: parent;
        width: page.width
        spacing: Theme.paddingLarge
        Button {
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Удалить"
            onClicked: pageStack.pop()
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Добавить"
            onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
        }
        Label {

            text: "Глубина стека: " + pageStack.depth
        }
        Label {

            text: "Добавленные страницы: " + pushPage.toString()
        }
        Label {

            text: "Удалённые страницы: " + popPage.toString()
        }
    }
}

