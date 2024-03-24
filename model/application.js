const db = require("./db").connection;
const dbName = require("../conf/config").dbConfig.database;

module.exports.createApplicationForUsers = async (user_id, listing_id, documenturl) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".create_application_request(?,?,?)";
            let query = "CALL " + procedureName;

            db.query(query, [user_id, listing_id, documenturl], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getListingByIDForUser", e);
            reject(e);
        }
    });
}

module.exports.getAllApplicationForUsers = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_applications_for_client(?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [user_id], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getListingByIDForUser", e);
            reject(e);
        }
    });
}


module.exports.getApplicationByIdForUser = async () => {
    return new Promise((resolve, reject) => {
        try {
            let query = `CALL song_has_genre('${genre}')`;
            
            db.query(query, (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getListingByIDForUser", e);
            reject(e);
        }
    });
}


module.exports.deleteApplicationForUsers = async (application_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".update_application_request(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [application_id, "Cancelled"], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getListingByIDForUser", e);
            reject(e);
        }
    });
}

module.exports.getAllApplicationForBrokers = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_applications_for_broker(?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [user_id], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getAllTourForUsers", e);
            reject(e);
        }
    });
}

module.exports.updateApplicationForBrokers = async (application_id, status) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".update_application_request(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [application_id, status], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getAllTourForUsers", e);
            reject(e);
        }
    });
}
