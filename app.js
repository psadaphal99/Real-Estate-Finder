'use strict';
const database = require("./model/db");
const cli = require("./cli/start");

async function run() {
    try {
        // connect to the database
        await database.connectToDatabase();

        // start the cli application
        await cli.start();

    } catch (e) {
        console.error("error in run",);
    }
}

run();


