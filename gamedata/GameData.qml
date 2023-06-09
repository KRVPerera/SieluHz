pragma Singleton

import QtQuick
import QtQuick.LocalStorage

QtObject {
    id: databaseSingleton

    readonly property string dB_NAME: "sieluHzGameDataDB"
    readonly property string dB_VERSION: "0.9"
    readonly property string dB_DESCRIPTION: "SieluHz game scores"

    property var db: null

    function openDatabase() {
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION,
                                               dB_DESCRIPTION, 1000000)
            db.transaction(function (tx) {
                tx.executeSql(
                            'CREATE TABLE IF NOT EXISTS sieluHzScores(name TEXT, score INTEGER)')
            })
        }
    }

    function addData(name, score) {
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION,
                                               dB_DESCRIPTION, 1000000)
        }
        db.transaction(function (tx) {
            tx.executeSql('INSERT INTO sieluHzScores VALUES(?, ?)',
                          [name, score])
        })
        console.log(name)
        console.log(score)
    }

    function cleanData() {
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION,
                                               dB_DESCRIPTION, 1000000)
        }
        db.transaction(function (tx) {
            tx.executeSql('DELETE FROM sieluHzScores')
        })
    }

    function fetchData() {
        var formattedData = []
        if (db === null) {
            db = LocalStorage.openDatabaseSync(dB_NAME, dB_VERSION,
                                               dB_DESCRIPTION, 1000000)
        }
        db.transaction(function (tx) {
            tx.executeSql(
                        'DELETE FROM sieluHzScores WHERE score NOT IN (SELECT score FROM sieluHzScores ORDER BY score DESC LIMIT 10)')

            var result = tx.executeSql('SELECT * FROM sieluHzScores ORDER BY score DESC LIMIT 10')
            for (var i = 0; i < result.rows.length; i++) {
                var highscoreRecord = result.rows.item(i)
                console.log(highscoreRecord.name, highscoreRecord.score)
                formattedData.push({
                                       "name": highscoreRecord.name,
                                       "score": highscoreRecord.score
                                   })
            }
        })
        return formattedData
    }

    function closeDatabase() {
        if (db !== null) {
            db.commit()
            db = null
        }
    }
}
