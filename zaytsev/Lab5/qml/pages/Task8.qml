import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    ConfigurationGroup {
        id: settings
        path: "/apps/app_name/settings"
        property var tf: "empty"
        property bool sw: false
    }

    Column {
        y: 200
        TextField {
            width: 300
            text: "Text"
            onTextChanged: {
                settings.tf = text
                console.log(settings.tf)
            }
        }

        TextSwitch {
            text: checked ? qsTr("Active") : qsTr("Inactive")
            description: qsTr("Switch with text label")
            onCheckedChanged:  {
                settings.sw = checked
                console.log(settings.sw)
            }
        }
    }

    Button {
        x: 20
        y: 1100
        width: 200
        text: "Назад"
        onClicked: pageStack.pop()
    }
}
