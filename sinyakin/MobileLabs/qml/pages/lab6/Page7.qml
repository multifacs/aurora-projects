import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "ConfigurationValue"
        title: "ContextMenu"
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

    ConfigurationValue {
        id: setting_1
        key: "/apps/app_name/setting_1"
        defaultValue: "Menu Default"
    }

    ConfigurationValue {
        id: setting_2
        key: "/apps/app_name/setting_2"
        defaultValue: false
    }


    Column {
        y: 200
        TextField {
            width: 300
            text: "Text"
            onTextChanged: {
                setting_1.value = text
                console.log(setting_1.value)
            }
        }

        TextSwitch {
            text: checked ? qsTr("Active") : qsTr("Inactive")
            description: qsTr("Switch with text label")
            onCheckedChanged:  {
                setting_2.value = checked
                console.log(setting_2.value)
            }
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page8.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
