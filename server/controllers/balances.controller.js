let db = require('../db/index');

module.exports.getAllTransactions = (req, res, next) => {
  db.balances.all('SELECT * FROM BALANCES', (err, data) => {
    if (err) return next(err);
    return res.json({ data });
  });
};