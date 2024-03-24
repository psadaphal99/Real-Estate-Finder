const mysql = require('mysql2');
const dbConfig = require('../conf/config').dbConfig;

// create connection object with configuration for mysql
module.exports.connection = mysql.createConnection({
    host: dbConfig.host,
    user: dbConfig.userName,
    password: dbConfig.password,
    database: dbConfig.name,
    port: dbConfig.port
});

module.exports.connectToDatabase = async function(){
    try {
        console.log("in connectDb")
        await dbConnection();
        return;
    }
    catch (err) {
        console.log("error in connecting to the database", err);
        process.exit(1);
    }
}

//connect to the database
function dbConnection() {
    return new Promise(function (resolve, reject) {
        try{
            // connect to the mysql database
            module.exports.connection.connect((err) => {
            if (err) {
                console.log("\nerror in connecting to the database");
                console.error(err?.message);
                console.error(err);
                reject(err);
            }
            else {
                console.log('\nConnected to the database successfully!');
                resolve();
            }
        });
        } catch(e){
            console.error("error in dbPnnection", e);
            reject(err);
        }
    });
}


// end the connection 
module.exports.terminateConnection = async()=>{
    return new Promise((resolve, reject)=>{
        module.exports.connection.end((err) => {
            if(err){
                console.error("\nerror in connection termination");
                reject(err);
            }
            else{
                console.log("\nconnection terminated");
                resolve();
            }
          });
    });
}
