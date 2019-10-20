const path = require('path');
const sqlite3 = require('sqlite3').verbose();

module.exports.transactions = new sqlite3.Database(path.resolve(__dirname, './transactions.db'));
module.exports.balances = new sqlite3.Database(path.resolve(__dirname, './balances.db'));