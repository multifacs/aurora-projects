import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../."

Page {
    property int lastPos: 0

    PageHeader {
        objectName: "Игра Ним"
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

    Label {
        id: annLabel
        text: "Ходит игрок"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: grid.top
    }

    Grid {
        columns: 5
        id: grid
        spacing: 50
        anchors.centerIn: parent
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: grid.bottom

        Label {
            text: "Выберите число предметов"
            visible: btnRow.visible
        }

        Row {
            id: btnRow
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "1"
                width: 100
                onClicked: take(1, true)
            }

            Button {
                text: "2"
                width: 100
                onClicked: take(2, true)
            }

            Button {
                text: "3"
                width: 100
                onClicked: take(3, true)
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Вернуться"
            onClicked: pageStack.replace(Qt.resolvedUrl("MainPage.qml"))
            id: returnBtn
            visible: false
        }
    }

    Timer {
        id: timer
    }

    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

    function take(taken, isPlayer) {
        if (lastPos > 0) {
            for (var i = lastPos - 1; i > lastPos - taken - 1; i--) {
                grid.children[i].visible = false
            }
            lastPos = lastPos - taken
        }

        if (isPlayer) {
            if (lastPos === 0) {
                btnRow.visible = false
                returnBtn.visible = true
                annLabel.text = "Вы играли"
                return
            }
            annLabel.text = "Ходит компьютер"
            var randomAmount = parseInt(Math.random() * 3)
            for (i = 0; randomAmount > lastPos; i++) randomAmount--
            if (randomAmount === 0) randomAmount++

            delay(1000, function() {
                take(randomAmount, false)
            })
        }

        if (!isPlayer) {
            if (lastPos === 0) {
                btnRow.visible = false
                returnBtn.visible = true
                annLabel.text = "Вы проиграли"
                return
            }
            annLabel.text = "Ходит игрок"
        }
    }

    Component.onCompleted: {
        lastPos = count
        console.log(lastPos)

        for (var i = 0; i < count; i++) {
            const newObject = Qt.createQmlObject('
                import QtQuick 2.0

                Rectangle {
                    color: "red"
                    width: 50
                    height: 50
                    y: 500
                }
                ',
                                                 grid
                                                 )
        }
    }
}
