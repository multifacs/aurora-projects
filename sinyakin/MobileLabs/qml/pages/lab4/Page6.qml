import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    PageHeader {
        objectName: "pageHeader"
        title: "TimePicker"
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
        TimePicker {
            anchors.horizontalCenter: parent.horizontalCenter
            id: timePicker
            hour: 15
            minute: 26
            hourMode: DateTime.TwelveHours
            onTimeTextChanged: {
                slider.value = minute
                combo.currentIndex = hour - 1
            }
        }

        Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 500
            label: "Ползунок"
            minimumValue: 0
            maximumValue: 60
            value: 10
            stepSize: 1
            valueText: value
            onValueChanged: timePicker.minute = value
            id: slider
        }

        ComboBox {
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Выпадающий список"
            description: "Описание выпадающего списка"
            id: combo
            menu: ContextMenu {
                MenuItem { text: "1" }
                MenuItem { text: "2" }
                MenuItem { text: "3" }
                MenuItem { text: "4" }
                MenuItem { text: "5" }
                MenuItem { text: "6" }
                MenuItem { text: "7" }
                MenuItem { text: "8" }
                MenuItem { text: "9" }
                MenuItem { text: "10" }
                MenuItem { text: "11" }
                MenuItem { text: "12" }
            }
            onCurrentIndexChanged: timePicker.hour = currentIndex + 1
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
