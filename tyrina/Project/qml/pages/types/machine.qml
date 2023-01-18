import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string pageToGo: "european.qml"
    property int cost: 6000

    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    Column {
        anchors.centerIn: parent
        width: parent.width
        spacing: 50

        Label {
            id: lbl
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Аппаратный"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Аппаратный маникюр и педикюр, как правило, «сухие»: наросшую кожу (а если быть точнее, ее ороговевшие частицы) убирают с помощью абразивных аппаратных насадок из металла или керамики, и для этого ее не нужно размягчать, так что можно обойтись без замачивания в ванночке."
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }

        Image {
            source: "../../images/types/machine.jpg"
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Стоимость: " + cost
            font.pixelSize: 50
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            Button {
                text: "Назад"
                width: 200
                onClicked: {
                    pageToGo = "european.qml"
                    animOut.start()
                }
            }
            Button {
                text: "Выбрать"
                width: 200
                onClicked: {
                    totalCost += cost
                    type = lbl.text
                    pageToGo = "../Finish.qml"
                    animOut.start()
                }
            }
            Button {
                text: "Вперед"
                width: 200
                onClicked: {
                    pageToGo = "japanese.qml"
                    animOut.start()
                }
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
            pageStack.replace(Qt.resolvedUrl(pageToGo))
            pageStack.completeAnimation()
        }
    }

    Component.onCompleted: {
        animIn.start()
    }
}
