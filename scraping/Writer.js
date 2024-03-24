const fs = require('fs');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const Table = require('cli-table');

// Define the columns for your CSV file
const rentCsvColumns = [
  { id: 'streetAddress', title: 'streetAddress' },
  { id: 'streetName', title: 'streetName' },
  { id: 'zipcode', title: 'zipcode' },
  { id: 'city', title: 'city' },
  { id: 'state', title: 'state' },
  { id: 'latitude', title: 'latitude' },
  { id: 'longitude', title: 'longitude' },
  { id: 'price', title: 'price' },
  { id: 'listing_type', title: 'listing_type' },
  { id: 'home_type', title: 'home_type' },
  { id: 'zpid', title: 'zpid' },
  { id: 'area', title: 'area' },
  { id: 'bedrooms', title: 'bedrooms' },
  { id: 'bathrooms', title: 'bathrooms' },
  { id: 'photos', title: 'photos' },
  { id: 'unit', title: 'unit' },
  { id: 'floor', title: 'floor' },
  { id: 'block', title: 'block' },
  { id: 'brokerName', title: 'brokerName' },
  { id: 'brokerBusinessName', title: 'brokerBusinessName' },
  { id: 'brokerPhonenumber', title: 'brokerPhonenumber' },
  { id: 'ownerName', title: 'ownerName' },
  { id: 'features', title: 'features' },
  { id: 'policies', title: 'policies' },
];

module.exports.writeInCSV = async (data, type) => {
  try {
    const rentCsvFilePath = 'Rent.csv';
    const saleCsvFilePath = "Sale.csv";
    // Create a CSV writer with the specified columns and file path
    const csvWriter = createCsvWriter({
      path: (type=="rent")? rentCsvFilePath: saleCsvFilePath,
      header: rentCsvColumns,
    });

    //  Write the data to the CSV file
    csvWriter.writeRecords(data)
      .then(() => console.log('CSV file successfully written'))
      .catch((err) => console.error(err));

    // let table = new Table();
    // table.push(["ID", "Name", "Number"]);
    // table.push([1, 'John Doe', 25]);
    // table.push([2, 'Jane Smith', 30]);   
    // console.log(table.toString());
  } catch (e) {
    console.error("error in write in csv", e);
    throw (e);
  }
}

//module.exports.writeInCSV();