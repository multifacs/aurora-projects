import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 8, задание 1"
    }

    IconButton {
        objectName: "aboutButton"
        icon.source: "image://theme/icon-m-rotate-left"
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: {
            pageStack.clear()
            pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

    Counter {
        id: counter
        count: 10;
    }

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        Label {
            id: label;
            anchors.horizontalCenter: parent.horizontalCenter
            text: counter.getCount();
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Увеличить"
            onClicked: {
                counter.inc();
                label.text = counter.getCount();
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Обнулить"
            onClicked: {
                counter.reset();
                label.text = counter.getCount();
            }
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
