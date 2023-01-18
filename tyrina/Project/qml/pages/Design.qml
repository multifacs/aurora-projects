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
            text: "ВИДЫ НЕЙЛ-ДИЗАЙНА"
            font.pixelSize: 50
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Image {
            source: "../images/design/french2.jpg"
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
            pageStack.replace(Qt.resolvedUrl("designs/plain.qml"))
            pageStack.completeAnimation()
        }
    }

    Component.onCompleted: {
        animIn.start()
    }
}
