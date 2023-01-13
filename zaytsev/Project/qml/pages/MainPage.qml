import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: mainPage

    property string currentTime: ""
    property double currentRotation: 0

    Component.onCompleted: {
        sendXhr(0)
    }

    function pad(num) {
        var s = "000000000" + num;
        return s.substr(s.length-2);
    }

    function sendXhr(i) {
        var xhr = new XMLHttpRequest();
        var weather

        var link = 'https://api.open-meteo.com/v1/forecast?latitude=' +
                cities[i].lat +
                '&longitude=' +
                cities[i].long +
                '&current_weather=true'

        xhr.open('GET', link, true);
        cities[i].updating = true
        console.log(i, "updating")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                weather = JSON.parse(xhr.responseText).current_weather

                cities[i].current_weather.temperature = (weather.temperature <0?"":"+") + weather.temperature
                cities[i].current_weather.windspeed = weather.windspeed
                cities[i].current_weather.winddirection = weather.winddirection
                cities[i].current_weather.weathercode = weather.weathercode

                repeater.model = cities
                cities[i].updating = false
                console.log(i, "done")
                if (i + 1 < cities.length) {
                    sendXhr(i + 1)
                }
            }
        }
        xhr.send();
    }

    Timer {
        running: true
        interval: 500
        repeat: true
        onTriggered: {
            var date = new Date()
            var arr = [pad(date.getHours()), pad(date.getMinutes()), pad(date.getSeconds())]

            currentRotation = (date.getHours() * 60 * 60 + date.getMinutes() * 60 + date.getSeconds()) / (60 * 60 * 24) * 360
            currentTime = arr.join(':')
        }
    }

    Timer {
        running: true
        interval: 5000
        repeat: true
        onTriggered: {
            sendXhr(0)
        }
    }

    Rectangle {
        color: "indigo"
        anchors.fill: parent

        Label {
            text: "Карта погоды Европы"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            color: "white"
            topPadding: 30
        }

        Image {
            source: "../images/map.jpg"
            width: parent.width
            fillMode: Image.PreserveAspectFit
            scale: 1.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            x: parent.width / 10
            y: parent.height / 6
            text: currentTime
            font.bold: true
            font.pixelSize: 50
            style: Text.Outline
            styleColor: "white"
        }

        Image {
            source: "../images/day_and_night.svg"
            x: parent.width / 2.1
            y: parent.height / 6
            scale: 1.5
            rotation: 36 + 180 + currentRotation
        }

        Button {
            text: "Обновить вручную"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "white"
            onClicked: sendXhr(0)
        }

        Repeater {
            id: repeater
            model: cities
            Rectangle {
                width: 20
                height: width
                radius: width / 2
                color: "red"
                x: modelData.x - width / 2
                y: modelData.y - width / 2

                MouseArea {
                    anchors.centerIn: parent
                    width: 100
                    height: width
                    onClicked: {
                        console.log(index)
                        pick = index
                        pageStack.push(Qt.resolvedUrl("WeatherPage.qml"))
                    }
                }

                Label {
                    x: -10
                    y: -50
                    color: "black"
                    style: Text.Outline
                    styleColor: "red"
                    font.pixelSize: 40
                    font.bold: true
                    text: modelData.current_weather.temperature + " °C"
                }

                Label {
                    x: -10
                    y: 15
                    color: modelData.updating ? "grey" : "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.pixelSize: 30
                    font.bold: true
                    text: modelData.name
                }

                Image {
                    source: getImage(modelData.current_weather.weathercode)
                    anchors.verticalCenter: parent.verticalCenter
                    x: -50
                    width: 50
                    height: width
                }
            }
        }
    }
}
