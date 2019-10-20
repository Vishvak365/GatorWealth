const express = require('express');
const Transactions = require('../controllers/transactions.controller');

const router = express.Router();

router.get('/', Transactions.getAllTransactions);
router.get('/basic', Transactions.getAllTransactionsBasic);

module.exports = router;