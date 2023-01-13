import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        anchors.centerIn: parent
        width: parent.width
        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 100
            height: 300
            Image {
                source: getImage(cities[pick].current_weather.weathercode)
                width: 200
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }
            Label {
                text: cities[pick].name
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                font.bold: true
                font.pixelSize: 70
            }
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 100
            height: 100
            Label {
                text: "Температура"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }
            Label {
                text: cities[pick].current_weather.temperature + " °C"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 100
            height: 100
            Label {
                text: "Скорость ветра"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }
            Label {
                text: cities[pick].current_weather.windspeed + " км/ч"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 100
            height: 300
            Label {
                text: "Направление ветра"
                wrapMode: Text.WordWrap
                width: 100
                anchors.left: parent.left
                anchors.top: parent.top
            }
            Image {
                source: "../images/compass.svg"
                rotation: cities[pick].current_weather.winddirection
                anchors.right: parent.right
                anchors.top: parent.top
                width: 400
                height: width
            }
        }
    }
}
