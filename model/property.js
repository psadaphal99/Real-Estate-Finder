const db = require("./db").connection;
const dbName = require("../conf/config").dbConfig.database;

module.exports.getAssignedPropertyForBroker = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_properties_for_owner(?)";
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


module.exports.getPropertyByIdForBroker = async () => {
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

module.exports.getPropertyByIdForOwner = async () => {
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


module.exports.createPropertyForOwner = async (num_beds, num_baths, area, property_type, latitude, longitude, street_number, street_name, city, zip, state, user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".create_property(?,?,?,?,?,?,?,?,?,?,?,?)";
            let query = "CALL " + procedureName;
            db.query(query, [num_beds, num_baths, area, property_type, latitude, longitude, user_id, street_number, street_name, city, zip, state], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in createPropertyForOwner", e);
            reject(e);
        }
    });
}

module.exports.getAllPropertyForOwner = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_properties_for_owner(?)";
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

module.exports.updatePropertyForOwner = async (property_id, num_beds, num_baths, area, property_type) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".update_property(?,?,?,?,?)";
            let query = "CALL " + procedureName;
            db.query(query, [property_id, num_beds, num_baths, area, property_type], (err, rows) => {
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


module.exports.deletePropertyForOwner = async (user_id, property_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".delete_property(?)";
            let query = "CALL " + procedureName;
            db.query(query, [property_id], (err, rows) => {
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
