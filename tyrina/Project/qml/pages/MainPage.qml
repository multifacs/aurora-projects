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
        spacing: 100

        Label {
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Виды маникюра: подробный гид"
            font.pixelSize: 60
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: "Новые виды маникюра продолжают появляться, хоть и могло показаться, что все возможные техники уже давно придуманы и активно применяются."
            wrapMode: Text.WordWrap
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height * 0.1
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Пройти подбор"
            onClicked: {
                anim.start()
            }
        }
    }

    Rectangle {
        id: filler
        anchors.fill: parent
        color: "white"
        opacity: 0
    }


    NumberAnimation {
        id: anim
        target: filler
        property: "opacity"
        duration: 200
        easing.type: Easing.InOutQuad
        from: 0
        to: 1
        onStopped: {
            pageStack.replace(Qt.resolvedUrl("Type.qml"))
            pageStack.completeAnimation()
        }
    }
}
