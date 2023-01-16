import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    objectName: "applicationWindow"
    initialPage: mainPage

    property int count: 5
    property int randomAmount: 0

    Page {
        id: mainPage

        PageHeader {
            objectName: "pageHeader"
            title: "Кучки"
        }

        Column {

            anchors.centerIn: parent
            spacing: 100

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Выберите количество предметов в кучке: "
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Количество"
                onTextChanged: count = parseInt(text)
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: count
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Начать"
                onClicked: {
                    if (count > 1) {
                        pageStack.replace(gamePage)
                        gamePage.onStart()
                    }
                }
            }
        }
    }

    Page {
        id: gamePage
        property int lastPos: 0

        PageHeader {
            objectName: "pageHeader"
            title: "Кучки"
        }

        Column {
            anchors.centerIn: parent

            spacing: 100

            Label {
                id: annLabel
                text: "Ходит игрок"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Grid {
                columns: 5
                id: grid
                spacing: 50
            }


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
                    onClicked: gamePage.take(1, true)
                }

                Button {
                    text: "2"
                    width: 100
                    onClicked: gamePage.take(2, true)
                }

                Button {
                    text: "3"
                    width: 100
                    onClicked: gamePage.take(3, true)
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Вернуться"
                onClicked: pageStack.replace(mainPage)
                id: returnBtn
                visible: false
            }
        }

        Timer {
            id: timer
            onTriggered: gamePage.take(randomAmount, false)
            interval: 1000
        }

        function take(taken, isPlayer) {
            console.log(taken)
            var temp = taken
            for (var i = 0; temp > lastPos; i++) temp--
            if (temp === 0) temp++

            if (lastPos > 0) {
                for (i = lastPos - 1; i > lastPos - temp - 1; i--) {
                    grid.children[i].visible = false
                }
                lastPos = lastPos - temp
            }

            if (isPlayer) {
                if (lastPos === 0) {
                    btnRow.visible = false
                    returnBtn.visible = true
                    annLabel.text = "Вы играли"
                    return
                }
                annLabel.text = "Ходит компьютер"
                randomAmount = parseInt(Math.random() * 5)
                console.log(randomAmount)
                timer.start()
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

        function onStart() {
            btnRow.visible = true
            returnBtn.visible = false
            annLabel.text = "Ходит игрок"
            lastPos = count
            console.log(lastPos)

            grid.children = []

            for (var i = 0; i < count; i++) {
                const newObject = Qt.createQmlObject('
                    import QtQuick 2.0

                    Rectangle {
                        width: 75
                        height: width
                        radius: width / 2
                        y: 500
                    }
                    ',
                                                     grid
                                                     )
                newObject.color = "#" + Math.floor(Math.random()*16777215).toString(16);
            }
        }
    }
}
