const db = require("./db").connection;
const dbName = require("../conf/config").dbConfig.database;
module.exports.login = async (username, password) => {
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
            console.error("error in login", e);
            reject(e);
        }
    });
}


module.exports.getRole = async (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".get_user_role(?)";
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
            console.error("error in getRole", e);
            reject(e);
        }
    });
}


module.exports.signupUser = async (input) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".signup_client(?,?,?,?,?,?,?,?)";
            let query = "CALL " + procedureName;

            db.query(query, [input.username, input.password, input.firstName, input.lastName, input.email,input.phone_number, input.dateOfBirth,input.gender], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in signupUser", e);
            reject(e);
        }
    });
}

module.exports.signupOwner = async (input) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".signup_owner(?,?,?,?,?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [input.username, input.password, input.firstName, input.lastName, input.email,input.state_id], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in signupOwner", e);
            reject(e);
        }
    });
}

module.exports.signupBroker = async (input) => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".signup_broker(?,?,?,?,?,?,?,?)";
            let query = "CALL " + procedureName;
            
            db.query(query, [input.username, input.password, input.firstName, input.lastName, input.email,input.license_reg_no, input.phone_number,input.agency_name], (err, rows) => {
                if (err) {
                    console.error("error in calling procedure from the database");
                    reject(err);
                    return;
                }
                resolve(rows);
                return;
            });
        } catch (e) {
            console.error("error in signupBroker", e);
            reject(e);
        }
    });
}


module.exports.deleteAccount = async () => {
    return new Promise((resolve, reject) => {
        try {
            let procedureName = dbName + ".login(?,?)";
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
            console.error("error in getAllTourForUsers", e);
            reject(e);
        }
    });
}
