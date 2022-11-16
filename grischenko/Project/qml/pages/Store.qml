pragma Singleton
import QtQuick 2.0
import QtQuick.LocalStorage 2.0

QtObject {
    property var date: new Date()
    property var db: LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "Mood DB", 1000000)
}
