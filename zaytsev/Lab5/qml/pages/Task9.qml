import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    ConfigurationGroup {
        id: settings
        path: "/sailfish/login"
        property string login: ""
        property string password: ""
        property bool check: false
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        TextField {
            width: 300
            text: settings.login
            placeholderText: "Логин"
            onTextChanged: {
                if (sw.checked) {
                    settings.login = text
                }
            }
        }

        TextField {
            width: 300
            text: settings.password
            placeholderText: "Пароль"
            onTextChanged: {
                if (sw.checked) {
                    settings.password = text
                }
            }
        }

        TextSwitch {
            id: sw
            text: "Запомнить"
            width: 400
        }
    }
}
