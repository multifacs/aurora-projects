import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string pageToGo: "european.qml"
    property int cost: 7000

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
            text: "Японский"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Эта техника — особый ритуал, который идеально подойдет тем, кто любит максимально естественные маникюр и педикюр, а также легко обходится без покрытия."
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }

        Image {
            source: "../../images/types/japanese.jpg"
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
                    pageToGo = "machine.qml"
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
                    pageToGo = "brazilian.qml"
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
