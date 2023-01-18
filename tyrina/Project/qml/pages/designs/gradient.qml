import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string pageToGo: "european.qml"
    property int cost: 1000

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
            text: "Омбре"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Маникюр омбре еще называют градиентным. В классическом варианте создают плавный переход от одного цвета на кончиках ногтей к другому — у основания."
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }

        Image {
            source: "../../images/design/gradient.jpg"
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
                    pageToGo = "moon.qml"
                    animOut.start()
                }
            }
            Button {
                text: "Выбрать"
                width: 200
                onClicked: {
                    totalCost += cost
                    design = lbl.text
                    pageToGo = "../Color.qml"
                    animOut.start()
                }
            }
            Button {
                text: "Вперед"
                width: 200
                onClicked: {
                    pageToGo = "drawing.qml"
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
