import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    Label {
        text: "Выберите основной цвет"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40
        width: parent.width
        topPadding: 25
    }

    SilicaFlickable {
        width: parent.width
        height: parent.height - 100

        anchors.bottom: parent.bottom

        SilicaGridView {

            anchors.fill: parent
            model: images

            cellHeight: parent.width / 3
            cellWidth: parent.width / 3
            delegate: Image {
                fillMode: Image.PreserveAspectFit
                source: "../images/polish/" + modelData
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        polishColor = modelData[0] + modelData[1]
                        pageStack.replace(Qt.resolvedUrl("Final.qml"))
                        pageStack.completeAnimation()
                    }
                }
                width: parent.width / 3
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
