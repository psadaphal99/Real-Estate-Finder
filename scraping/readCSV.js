const fs = require('fs');
const csv = require('csv-parser');

// Specify the path to your CSV file
const csvFilePath = '../propertyData.csv';

// Columns to fetch
const columnsToFetch = ['ST_NUM', 'ST_NAME', 'OWNER'];

// Create an array to store the filtered data
const filteredData = [];


module.exports.getOwners = async () => {
    return new Promise(async (resolve, reject) => {
        try {
            // Read the CSV file and fetch specified columns
            fs.createReadStream(csvFilePath)
                .pipe(csv())
                .on('data', (row) => {
                    // Create a new object with only the specified columns
                    const filteredRow = {};
                    columnsToFetch.forEach(column => {
                        if (row[column] !== undefined) {
                            filteredRow[column] = row[column];
                        }
                    });
                    filteredData.push(filteredRow);
                })
                .on('end', () => {
                    // Display the filtered data
                    console.log(filteredData);
                    resolve(filteredData);
                })
                .on('error', (error) => {
                    console.error('Error reading CSV file:', error);
                });
        } catch (e) {
            console.error("error in reading csv", e);
            reject(e);
        }
    });
}


module.exports.getOwners();


