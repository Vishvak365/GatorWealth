const express = require('express');
const Balances = require('../controllers/balances.controller');

const router = express.Router();

router.get('/', Balances.getAllTransactions);

module.exports = router;