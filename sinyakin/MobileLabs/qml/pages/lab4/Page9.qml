import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "Slider"
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

    Column {
        anchors.centerIn: parent
        Slider {
            width: 500
            label: "Ползунок"
            maximumValue: 40
            minimumValue: -10
            value: 10
            stepSize: 1
            valueText: value
            onValueChanged: console.log(value)
            id: slider
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Значение: " + slider.value
        }
    }
}
