import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Counter {
        id: counter
        count: 10;
    }

    Column {
        id: column
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        y: 300

        Label {
            id: label;
            anchors.horizontalCenter: parent.horizontalCenter
            text: counter.getCount();
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+"
            onClicked: {
                counter.inc();
                label.text = counter.getCount();
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "0"
            onClicked: {
                counter.reset();
                label.text = counter.getCount();
            }
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 500
        text: "Слова"
        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page2.qml")))
    }

}
