let db = require('../db/index');

module.exports.getAllTransactions = (req, res, next) => {
  db.transactions.all('SELECT * FROM TRANSACTIONS', (err, data) => {
    if (err) return next(err);
    return res.json({ data });
  });
};

module.exports.getAllTransactionsBasic = (req, res, next) => {
  db.transactions.all('SELECT transactions_name, transactions_amount, transactions_date FROM TRANSACTIONS', (err, data) => {
    if (err) return next(err);
    return res.json({ data });
  });
};