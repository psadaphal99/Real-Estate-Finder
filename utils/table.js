const Table = require('cli-table');

module.exports.displayData = (data)=> {
const table = new Table({
    head: Object.keys(data[0]),
  });
  data.forEach(row => {
    table.push(Object.values(row));
  });
  console.table(data);
}