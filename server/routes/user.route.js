require('../services/passport');
const express = require('express');
const need = require('../services/require');
const verify = require('../services/verify');
const Authentication = require('../controllers/user.authentication.controller');

const router = express.Router();

router.get('/', need.auth, Authentication.getUserInfo);
router.post('/login', need.login, Authentication.login);
router.post('/signup', Authentication.signup);
router.post('/name', need.auth, Authentication.getUserName);

module.exports = router;