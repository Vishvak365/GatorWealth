const express = require('express');
const need = require('../services/require');
const PlaidAccounts = require('../controllers/plaid.account.controller');

const PlaidAccount = require('../models/plaid.account.model');
const User = require('../models/user.model');

const router = express.Router();

router.post('/accounts/add', need.auth, PlaidAccounts.addAccount);

module.exports = router;