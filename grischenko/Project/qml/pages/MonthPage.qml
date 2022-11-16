import QtQuick 2.0
import Sailfish.Silica 1.0
import "."
import QtQuick.LocalStorage 2.0

Page {

    ListModel {
        id: days
    }

    Item {
        width: parent.width
        height: parent.height * 0.9
        anchors.centerIn: parent
        SilicaGridView {
            anchors.fill: parent
            model: days
            header: PageHeader { title: "Выберите день" }

            cellWidth: width / 4
            cellHeight: cellWidth

            id: gridView

            delegate: Item {
                width: GridView.view.cellWidth
                height: GridView.view.cellHeight

                Rectangle {
                    width: 120
                    height: width
                    anchors.centerIn: parent
                    border.color: "grey"
                    border.width: 2
                    radius: 10
                    color: "transparent"
                    Text {
                        text: name
                        x: 10
                        y: 10
                        font.pixelSize: 20
                    }

                    IconButton {
                        anchors.centerIn: parent
                        icon.source: mood + ".png"
                        icon.color: undefined
                        onClicked: {
                            console.log(index)
                            Store.date.setDate(index + 1)
                            pageStack.replace(Qt.resolvedUrl("MoodPage.qml"))
                        }
                        opacity: mood === "none" ? 0 : 1
                    }
                }
            }
        }
    }

    Button {
        text: "Назад"
        onClicked: {
            pageStack.push(Qt.resolvedUrl("MainPage.qml"))
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    function daysInMonth (month, year) {
        return new Date(year, month, 0).getDate();
    }

    Component.onCompleted: {

        var data = null

        Store.db.transaction(
            function(tx) {
                // Show all added greetings
                var rs = tx.executeSql('SELECT * FROM moods');

                var r = []
                for (var i = 0; i < rs.rows.length; i++) {
                    r.push(rs.rows.item(i))
                }
                data = r.filter(function(x) {
                    var oldTime = x.date
                    x.date = new Date()
                    x.date.setTime(oldTime)

                    return x
                })
            }
        )

        console.log(JSON.stringify(data))

        var daysNum = daysInMonth(Store.date.getMonth() + 1, Store.date.getFullYear())

        for (var i = 1; i <= daysNum; i++) {
            var oldDate = Store.date.getTime().toString()
            var someDate = new Date()
            someDate.setTime(oldDate)

            // console.log(someDate)
            someDate.setDate(i)
            // console.log(someDate, i - 1)

            var newRecord = { name: i, mood: "none" }
            data.forEach(function(x) {
                if (x.date.getMonth() === someDate.getMonth() && x.date.getDate() === someDate.getDate()) {
                    newRecord.mood = x.mood
                }
            })
            days.append(newRecord)
        }
    }

}
