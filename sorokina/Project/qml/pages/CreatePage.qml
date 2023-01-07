import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "aboutPage"
    allowedOrientations: Orientation.All

    property int sizeX: 5
    property int sizeY: 5
    property int currentIndex: 0

    Column {
        anchors.centerIn: parent
        spacing: 20
        id: inputColumn

        Label {
            text: "Введите размеры кроссворда"
            horizontalAlignment: Text.AlignHCenter
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: xField
                text: "5"
                width: 150
                horizontalAlignment: Text.AlignHCenter
                onTextChanged: sizeX = parseInt(text)
                validator: IntValidator {}
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }

            TextField {
                id: yField
                text: "5"
                width: 150
                horizontalAlignment: Text.AlignHCenter
                onTextChanged: sizeY = parseInt(text)
                validator: IntValidator {}
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }
        }

        Button {
            text: "Подтвердить"
            onClicked: {
                if (parseInt(xField.text) > 0 && parseInt(yField.text) > 0) {
                    createGrid()
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: gridColumn
        visible: false
        anchors.centerIn: parent
        spacing: 20

        Grid {
            id: grid
            columns: sizeY
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "Создать"
            onClicked: createCrossword()
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    function createGrid() {
        storage.push({
                         sizeX: sizeX,
                         sizeY: sizeY,
                         array: []
                     })
        currentIndex = storage.length - 1
        for (var i = 0; i < sizeX * sizeY; i++) {
            const newObject = Qt.createQmlObject('
                import QtQuick 2.0

                Rectangle {
                    width: 50
                    height: 50
                    color: "white"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (parent.color == "#ffffff") {
                        storage[' + currentIndex + '].array[' + i +'] = 1
                        parent.color = "black"
                    } else {
                        storage[' + currentIndex + '].array[' + i +'] = 0
                        parent.color = "white"
                    }
                }
            }
                }
                ',
                                                 grid
                                                 )
            storage[currentIndex].array.push(0)
        }
        inputColumn.visible = false
        gridColumn.visible = true
    }

    function createCrossword() {
        console.log(storage)
        pageStack.pop()
    }
}
