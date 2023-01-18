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
            text: "ТИПЫ ПОКРЫТИЯ НОГТЕЙ"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Следующий шаг после получения нужной формы и ухода за кожей вокруг ногтей и за самими ногтями — выбор покрытия. В некоторых случаях (например, после японского маникюра) ногти приобретают такой красивый блеск, что можно обойтись и без дополнения в виде лака. Правда, если не для красоты, то хотя бы для защиты ногтей покрытие все же делать стоит. Однако выбор остается за вами."
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }

        Image {
            source: "../images/finish/begin.jpg"
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
            pageStack.replace(Qt.resolvedUrl("finishes/healing.qml"))
            pageStack.completeAnimation()
        }
    }

    Component.onCompleted: {
        animIn.start()
    }
}
