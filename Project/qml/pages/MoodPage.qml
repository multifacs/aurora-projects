import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {

    Row {
        anchors.centerIn: parent

        IconButton {
            icon.source: "good.png"
            icon.color: undefined
            onClicked: {
                setMood("good")
                pageStack.replace(Qt.resolvedUrl("MonthPage.qml"))
            }
        }

        IconButton {
            icon.source: "average.png"
            icon.color: undefined
            onClicked: {
                setMood("average")
                pageStack.replace(Qt.resolvedUrl("MonthPage.qml"))
            }
        }

        IconButton {
            icon.source: "bad.png"
            icon.color: undefined
            onClicked: {
                setMood("bad")
                pageStack.replace(Qt.resolvedUrl("MonthPage.qml"))
            }
        }
    }

    function setMood(mood) {
        console.log(mood)

        Store.db.transaction(
            function(tx) {
                // "REPLACE into table (id, name, age) values(1, "A", 19)"
                tx.executeSql('REPLACE INTO moods (date, mood) VALUES(?, ?)', [ Store.date.getTime().toString(), mood ]);
            }
        )
    }

}
