import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    Column {
        anchors.centerIn: parent
        width: parent.width
        spacing: 50

        Label {
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Ваш выбор:"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Тип: " + type
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Покрытие: " + finish
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Дизайн: " + design
            wrapMode: Text.WordWrap
            font.pixelSize: 28
            visible: finish != "Гигиенические и лечебные покрытия"
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Цвет: " + polishColor
            wrapMode: Text.WordWrap
            font.pixelSize: 28
            visible: finish != "Гигиенические и лечебные покрытия"
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Итого: " + totalCost
            wrapMode: Text.WordWrap
            font.pixelSize: 50
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "В начало"
            onClicked: {
                animOut.start()
            }
        }
    }

    Rectangle {
        id: filler
        anchors.fill: parent
        color: "white"
        opacity: 1
    }


    NumberAnimation {
        id: animIn
        target: filler
        property: "opacity"
        duration: 200
        easing.type: Easing.InOutQuad
        from: 1
        to: 0
    }

    NumberAnimation {
        id: animOut
        target: filler
        property: "opacity"
        duration: 200
        easing.type: Easing.InOutQuad
        from: 0
        to: 1
        onStopped: {
            totalCost = 0
            type = ""
            finish = ""
            design = ""
            polishColor = ""
            pageStack.replace(Qt.resolvedUrl("MainPage.qml"))
            pageStack.completeAnimation()
        }
    }

    Component.onCompleted: {
        animIn.start()
    }
}
