import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Лаб. 6, задание 8"
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

    ConfigurationGroup {
        id: settings
        path: "/apps/app_name/settings"
        property string tf: "empty"
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
}
