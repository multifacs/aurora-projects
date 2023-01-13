import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    objectName: "applicationWindow"
    initialPage: Qt.resolvedUrl("pages/MainPage.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    property int pick: 0
    property var cities: [
        {
            name: "Берлин",
            lat: 52.52,
            long: 13.41,
            x: 201 * 2,
            y: 334 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Париж",
            lat: 48.85,
            long: 2.35,
            x: 94 * 2,
            y: 379 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Лондон",
            lat: 51.51,
            long: -0.13,
            x: 86 * 2,
            y: 336 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Мадрид",
            lat: 40.42,
            long: -3.70,
            x: 11 * 2,
            y: 474 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Рим",
            lat: 41.89,
            long: 12.51,
            x: 186 * 2,
            y: 482 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Минск",
            lat: 53.90,
            long: 27.57,
            x: 314 * 2,
            y: 303 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        },
        {
            name: "Осло",
            lat: 59.91,
            long: 10.75,
            x: 184 * 2,
            y: 229 * 2,
            current_weather: {
                temperature: 0,
                windspeed: 0,
                winddirection: 0,
                weathercode: 0
            },
            updating: false
        }
    ]

    function getImage(code) {
        var path

        // console.log(code)

        switch (code) {
        case 0:
            path = "../images/weather/sun.png"
            break;
        case 1:
        case 2:
        case 3:
            path = "../images/weather/partly-cloudy.png"
            break;
        case 45:
        case 48:
            path = "../images/weather/fog.png"
            break;
        case 51:
        case 53:
        case 55:
            path = "../images/weather/drizzle.png"
            break;
        case 56:
        case 57:
            path = "../images/weather/freezing-drizzle.png"
            break;
        case 61:
        case 63:
        case 65:
            path = "../images/weather/rain.png"
            break;
        case 66:
        case 67:
            path = "../images/weather/freezing-rain.png"
            break;
        case 71:
        case 73:
        case 75:
            path = "../images/weather/snow.png"
            break;
        case 77:
            path = "../images/weather/snow-grains.png"
            break;
        case 80:
        case 81:
        case 82:
            path = "../images/weather/rain-shower.png"
            break;
        case 85:
        case 86:
            path = "../images/weather/heavy-snow.png"
            break;
        case 95:
            path = "../images/weather/thunderstorm.png"
            break;
        case 96:
        case 99:
            path = "../images/weather/thunderstorm-hail.png"
            break;
        default:
            path = "../images/weather/sun.png"
        }

        return path
    }
}
