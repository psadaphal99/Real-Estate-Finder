const db = require("./db").connection;
const dbName = require("../conf/config").dbConfig.database;

module.exports.getAllTourForUsers = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_tour_requests_for_client(?)";
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

module.exports.getAllTourForBrokers = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_tour_requests_for_broker(?)";
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


module.exports.createTourForUsers = async (user_id, listing_id, tourDate, tourTime, tourInstructions) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".create_tour_request(?,?,?,?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [user_id, listing_id, tourDate, tourTime, tourInstructions], (err, rows) => {

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


module.exports.getTourByIdForUsers = async () => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".login(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [username, password], (err, rows) => {

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


module.exports.deleteTourForUser = async (tour_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".update_tour_request(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [tour_id, "Cancelled"], (err, rows) => {

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


module.exports.updateTourForBroker = async (tour_id, status) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".update_tour_request(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [tour_id, status], (err, rows) => {
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
