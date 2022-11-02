import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 4, задание 5"
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

    DatePicker {
        y: 100
        date: new Date()
        daysVisible: true
        weeksVisible: true
        onDateTextChanged: {
            slider1.value = year
            slider2.value = month
        }
        monthYearVisible: true
        id: datePicker
    }

    Column {
        y: 800
        Slider {
            width: 500
            label: "Год"
            minimumValue: 2000
            maximumValue: 2022
            value: 2000
            stepSize: 1
            valueText: value
            onValueChanged: {
                var newdate = new Date()
                newdate.setFullYear(value)
                datePicker.date = newdate
            }

            id: slider1
        }

        Slider {
            width: 500
            label: "Месяц"
            minimumValue: 0
            maximumValue: 11
            value: 10
            stepSize: 1
            valueText: value
            onValueChanged: {
                // datePicker.date.setMonth(value)
                var newdate = new Date()
                newdate.setMonth(value)
                datePicker.date = newdate
            }

            id: slider2
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
