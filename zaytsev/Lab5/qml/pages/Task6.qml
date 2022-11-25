import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property var db: LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000)

    Column {
        y: 100
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter

        TextField {
            anchors.horizontalCenter: parent.horizontalCenter
            id: txtfield
            width: 400
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Новая запись"
            onClicked: {
                db.transaction(function(tx) {
                    tx.executeSql("INSERT INTO notes (note_text) VALUES(?);", [txtfield.text]);

                    // Show all added greetings
                    var rs = tx.executeSql('SELECT * FROM notes');

                    var r = []
                    for (var i = 0; i < rs.rows.length; i++) {
                        r.push(rs.rows.item(i))
                    }
                    console.log(r)
                    container.notesModel = r
                });

            }
        }
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.5

        property var notesModel: []

        SilicaListView {
            anchors.fill: parent
            model: container.notesModel
            delegate: Label {
                width: parent.width
                height: 100
                Text {
                    text: modelData.note_text
                    anchors.centerIn: parent
                }
            }
            spacing: 5
        }

        function findGreetings() {
            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('DROP TABLE IF EXISTS notes');
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS notes(note_text TEXT)');

                            // Add (another) greeting row
                            tx.executeSql('INSERT INTO notes VALUES(?)', [ '123' ]);

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM notes');

                            var r = []
                            for (var i = 0; i < rs.rows.length; i++) {
                                r.push(rs.rows.item(i))
                            }
                            console.log(r)
                            container.notesModel = r
                        }
                        )
        }
        Component.onCompleted: findGreetings()
    }

    Button {
        x: 500
        y: 1100
        width: 200
        text: "Вперед"
        onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task7.qml")))
    }
    Button {
        x: 20
        y: 1100
        width: 200
        text: "Назад"
        onClicked: pageStack.pop()
    }
}
