import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var possiblewords
    property var answers

    property string answer
    property int currItem: 0

    SilicaFlickable {
        id: container
        opacity: 0.2
        anchors.fill: parent
        Column {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: announcementLabel
                text: "Вводите слова длиной 5"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Grid {
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 5
                spacing: 5

                Repeater {
                    id: repeater
                    model: 25
                    delegate: Rectangle {
                        property string letter: ''
                        width: 100
                        height: 100
                        color: {
                            var colorString = "grey"
                            if (letter !== '') {
                                if (answer.indexOf(letter) !== -1) colorString = "gold"
                                if (answer.indexOf(letter) == index % 5) colorString = "lime"
                            }

                            return colorString
                        }

                        Label {
                            text: letter
                            font.capitalization: Font.AllUppercase
                            anchors.centerIn: parent
                            font.pixelSize: 40
                            color: "black"
                        }
                    }
                }
            }

            Button {
                id: checkBtn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Проверить"

                onClicked: {
                    var word = answerField.text.toLowerCase()
                    console.log(word.length, word)
                    if (word.length === 5) {
                        if (word == answer) {
                            answerField.visible = false
                            visible = false
                            resetBtn.visible = true
                        }

                        if (possiblewords.indexOf(word) !== -1) {
                            console.log(word)
                            answerField.text = ""

                            for (var i = 0; i < 5; i++) {
                                repeater.itemAt(i + currItem).letter = word[i]
                            }
                            currItem += 5

                        } else {
                            announcementLabel.text = "Нет такого слова"
                        }

                        if (currItem === 25 && word != answer) {
                            announcementLabel.text = "Не получилось"
                            answerField.visible = false
                            visible = false
                            resetBtn.visible = true
                        }
                    }
                }
            }

            TextField {
                id: answerField
                anchors.horizontalCenter: parent.horizontalCenter
                width: 500
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                text: "Заново"
                anchors.horizontalCenter: parent.horizontalCenter
                id: resetBtn
                visible: false
                onClicked: resetGame()
            }
        }
    }

    function resetGame() {
        resetBtn.visible = false
        answerField.visible = true
        checkBtn.visible = true

        var xhrAnswers = new XMLHttpRequest();
        xhrAnswers.open('GET', 'https://gist.githubusercontent.com/cfreshman/a7b776506c73284511034e63af1017ee/raw/a9e1bb729eb54af16f8989f08f82eaab12a601ad/wordle-nyt-answers-alphabetical.txt');

        var xhrPossibleWords = new XMLHttpRequest();
        xhrPossibleWords.open('GET', 'https://raw.githubusercontent.com/tabatkins/wordle-list/main/words')

        xhrAnswers.send();

        xhrPossibleWords.onreadystatechange = function() {
            if (xhrPossibleWords.readyState === XMLHttpRequest.DONE) {
                possiblewords = xhrPossibleWords.responseText.split("\n")
                console.log(possiblewords.length)
                container.opacity = 1
            }
        }

        xhrAnswers.onreadystatechange = function() {
            if (xhrAnswers.readyState === XMLHttpRequest.DONE) {
                answers = xhrAnswers.responseText.split("\n")
                //console.log(answers)
                var idx = parseInt(Math.random() * answers.length + 1)
                console.log(idx)
                answer = answers[idx]
                // announcementLabel.text = answer

                xhrPossibleWords.send()
            }
        }
    }

    Component.onCompleted: {
        resetGame()
    }
}
