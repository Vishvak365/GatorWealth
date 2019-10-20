const jwt_decode = require('jwt-decode');
const User = require('../models/user.model');
const authErrors = require('../helpers/user.authentication.errors');

/* Functions for verifying information */

/**
 * Checks if the email has the correct format
 * @param {String} email
 * @returns {Boolean} Result of regular expression test of email
 */
module.exports.email = function(email) {
  const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  return emailRegex.test(email);
};

/**
 * Checks if the phone number has the correct format
 * @param {String} email
 * @returns {Boolean} Result of regular expression test of phone number
 */
module.exports.phoneNumber = function(phoneNumber) {
  const phoneNumberRegex = /\([1-9][0-9]{2}\)\s[0-9]{3}\-[0-9]{4}/;
  return phoneNumberRegex.test(phoneNumber);
};