import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "aboutPage"
    allowedOrientations: Orientation.All

    property var answer: []
    property var currentArray: []

    SilicaFlickable {
        id: choiceList
        visible: true
        anchors.fill: parent

        Column {
            anchors.centerIn: parent
            spacing: 20

            Label {
                text: "Выберите кроссворд"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
            }

            SilicaListView {
                width: parent.width
                height: 300
                model: storage
                delegate: Button {
                    width: 150
                    text: model.index + 1
                    onClicked: {
                        console.log(modelData.sizeX)
                        answer = modelData.array
                        showCrossword(modelData)
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                spacing: 10
            }

        }
    }

    Column {
        id: gridColumn
        visible: false
        anchors.centerIn: parent
        spacing: 20

        Grid {
            id: grid
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "Проверить"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                check()
            }
        }

        Label {
            id: checkLabel
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0
        }
    }

    function showCrossword(modelData) {
        choiceList.visible = false
        gridColumn.visible = true

        currentArray = []
        for (var i = 0; i < modelData.sizeX * modelData.sizeY; i++) {
            currentArray.push(0)
        }

        var xArrays = []
        var yArrays = []

        for (i = 0; i < modelData.sizeX; i++) {
            xArrays.push([])
            var count = 0;
            for (var j = 0; j < modelData.sizeY; j++) {
                if (modelData.array[i * modelData.sizeX + j] == 1) {
                    count++
                }
                if ((modelData.array[i * modelData.sizeX + j] == 0 || j == modelData.sizeY - 1) && count != 0) {
                    xArrays[i].push(count)
                    count = 0
                }
            }
        }

        for (j = 0; j < modelData.sizeY; j++) {
            yArrays.push([])
            count = 0;
            for (i = 0; i < modelData.sizeX; i++) {
                if (modelData.array[i * modelData.sizeX + j] == 1) {
                    count++
                }
                if ((modelData.array[i * modelData.sizeX + j] == 0 || i == modelData.sizeX - 1) && count != 0) {
                    yArrays[j].push(count)
                    count = 0
                }
            }
        }

        console.log(xArrays)
        console.log(yArrays)

        var maxX = 0
        var maxY = 0

        for (i = 0; i < xArrays.length; i++) {
            if (xArrays[i].length > maxX) maxX = xArrays[i].length
        }
        for (i = 0; i < yArrays.length; i++) {
            if (yArrays[i].length > maxY) maxY = yArrays[i].length
        }

        console.log(maxX)
        console.log(maxY)

        grid.columns = modelData.sizeY + maxX

        for (i = 0; i < modelData.sizeX + maxY; i++) {
            for (j = 0; j < modelData.sizeY + maxX; j++) {

                var newObject

                if (i >= maxY && j >= maxX) {
                    newObject = Qt.createQmlObject('
                                        import QtQuick 2.0
                                        import Sailfish.Silica 1.0

                                        Rectangle {
                                            width: 50
                                            height: 50
                                            color: "white"

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    if (parent.color == "#ffffff") {
                                                        currentArray[' + ((i - maxY) * modelData.sizeX + j - maxX) + '] = 1
                                                        parent.color = "black"
                                                    } else {
                                                        currentArray[' + ((i - maxY) * modelData.sizeX + j - maxX) + '] = 0
                                                        parent.color = "white"
                                                    }
                                                    console.log(currentArray)
                                                    console.log(answer)
                                                }
                                            }
                                        }
                                        ',
                                                   grid
                                                   )
                } else {
                    newObject = Qt.createQmlObject('
                                        import QtQuick 2.0
                                        import Sailfish.Silica 1.0

                                        Rectangle {
                                            width: 50
                                            height: 50
                                            color: "grey"
                                            Label {
                                                horizontalAlignment: Text.AlignHCenter
                                                anchors.centerIn: parent
                                            }
                                        }
                                        ',
                                                   grid
                                                   )
                }

                if (i >= maxY && j < maxX) {
                    newObject.color = "grey"
                    if (j >= maxX - xArrays[i - maxY].length) {
                        newObject.children[0].text = xArrays[i - maxY][j - (maxX - xArrays[i - maxY].length)]
                    }
                } else if (i < maxY && j >= maxX) {
                    newObject.color = "grey"
                    if (i >= maxY - yArrays[j - maxX].length) {
                        newObject.children[0].text = yArrays[j - maxX][i - (maxY - yArrays[j - maxX].length)]
                    }
                } else if (i < maxY && j < maxX) {
                    newObject.opacity = 0
                }
            }
        }
    }

    function check() {
        console.log(JSON.stringify(answer) === JSON.stringify(currentArray))

        checkLabel.opacity = 1
        if (JSON.stringify(answer) === JSON.stringify(currentArray)) {
            checkLabel.text = "Правильно"
        } else {
            checkLabel.text = "Неправильно"
        }
    }

}
