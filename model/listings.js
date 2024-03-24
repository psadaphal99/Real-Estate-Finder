const db = require("./db").connection;
const dbName = require("../conf/config").dbConfig.database;

module.exports.getAllAreas = async () => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_available_areas()";
            let query = "CALL " + procedureName;
            

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
            console.error("error in getAllareas", e);
            reject(e);
        }
    });
}


module.exports.getAllListingsForUser = async (user_id, type, area) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_listing_by_area(?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [area, type], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in getAllListingsForUser", e);
            reject(e);
        }
    });
}

module.exports.getAllListingsForBroker = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_listings_for_broker(?)";
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
            console.error("error in getAllListingsForUser", e);
            reject(e);
        }
    });
}

module.exports.getListingByIDForUser = async () => {
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

module.exports.createListingForBroker = async (broker_id, listing_type, price, isactive, summary, property_id, media_url, features, policy) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".create_listing(?,?,?,?,?,?,?,?,?)";
            let query = "CALL " + procedureName;
            db.query(query, [broker_id, listing_type, price, true, summary, property_id, media_url, features, policy], (err, rows) => {
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


module.exports.updateListingForBroker = async (listing_type, price, summary, isactive, listing_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_listings_for_broker(?)";
            let query = "CALL " + procedureName;
            db.query(query, [listing_id, listing_type, price, true, summary], (err, rows) => {
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


module.exports.deleteListingForBroker = async (listing_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".delete_listing(?)";
            let query = "CALL " + procedureName;
            db.query(query, [listing_id], (err, rows) => {
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


module.exports.getAllListingsByPropertyForOwner = async (user_id, property_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_listings_for_property(?)";
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
