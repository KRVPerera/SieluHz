pragma Singleton
import QtQuick.LocalStorage

QtObject {
    id: databaseSingleton

    readonly property string dB_NAME : "sieluHzGameDataDB"
    readonly property string dB_VERSION : "0.9"
    readonly property string dB_DESCRIPTION : "SieluHz game scores"

    property var db: null

    function openDatabase() {
        if (db === null) {
           db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION, dB_DESCRIPTION, 1000000)
           db.transaction(function(tx) {
               tx.executeSql('CREATE TABLE IF NOT EXISTS employees(name TEXT, age INTEGER)')
           })
        }
    }

    function addData() {
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION, dB_DESCRIPTION, 1000000)
        }
        db.transaction(function(tx) {
            tx.executeSql('INSERT INTO employees VALUES(?, ?)', ["John Doe", 30])
            tx.executeSql('INSERT INTO employees VALUES(?, ?)', ["Jane Smith", 25])
        })
    }

    function fetchData() {
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION, dB_DESCRIPTION, 1000000)
        }
        db.transaction(function(tx) {
            var result = tx.executeSql('SELECT * FROM employees')
            for (var i = 0; i < result.rows.length; i++) {
                console.log(result.rows.item(i).name, result.rows.item(i).age)
            }
        })
    }

    function closeDatabase() {
        if (db !== null) {
            db.commit()
            db = null
        }
    }
}
