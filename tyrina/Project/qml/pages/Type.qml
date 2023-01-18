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
            text: "КАКИЕ ЕСТЬ ТЕХНИКИ МАНИКЮРА И ПЕДИКЮРА?"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Маникюр и педикюр — это прежде всего процедуры, направленные на уход за ногтями и кожей, основа основ. Какой бы красивый и оригинальный нейл-арт вы ни придумали, без аккуратной формы ногтей и ухоженной кожи вокруг них он не сможет украсить ваш образ; даже однотонное покрытие вряд ли будет выглядеть красиво. Уделять время уходу нужно обязательно, тем более возможностей для этого немало. Существует более десятка видов маникюра и педикюра, так что остается лишь выбрать, какой из них вам больше подходит."
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }

        Image {
            source: "../images/types/begin.jpg"
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Подобрать тип"
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
            pageStack.replace(Qt.resolvedUrl("types/classic.qml"))
            pageStack.completeAnimation()
        }
    }

    Component.onCompleted: {
        animIn.start()
    }
}
