/**
 * These authentication functions will return a token if authentication is successful
 * Passport returns a 400 error if email or password not provided
 * Passport returns a 401 error if authentication fails
 */
const jwt = require('jwt-simple');
const jwt_decode = require('jwt-decode');
const config = require('../config/config');
const verify = require('../services/verify');
const User = require('../models/user.model');
const authErrors = require('../helpers/user.authentication.errors');

/**
 * Find and return a user's information given their id
 * @module getUserInfo
 * @param {Object}    req   - Express request object
 * @param {Object}    res   - Express response object
 * @param {Function}  next  - Express next middleware function
 */
module.exports.getUserName = function(req, res, next) {
  const token = req.headers.authorization;
  const id = jwt_decode(token).sub;
  User.findById(id, function(err, user) {
    if (err) return next(err);
    const { firstName, lastName, email, joinedOn } = user;
    res.json({ name: firstName });
  });
}

/**
 * Generate an auth token based on the id of the user
 * This token can be decoded without the secret key, but cannot be re-encoded and sent back
 * unless the secret key is known
 * @param {Model} user
 * @returns {String} Encoded token containg user id and timestamp
 */
function tokenForUser(user) {
  // expiration time?
  const timestamp = new Date().getTime();
  return jwt.encode({ sub: user.id, iat: timestamp }, config.secret);
}

/**
 * Find and return a user's information given their id
 * @module getUserInfo
 * @param {Object}    req   - Express request object
 * @param {Object}    res   - Express response object
 * @param {Function}  next  - Express next middleware function
 */
module.exports.getUserInfo = function(req, res, next) {
  const token = req.headers.authorization;
  const id = jwt_decode(token).sub;
  User.findById(id, function(err, user) {
    if (err) return next(err);
    const { firstName, lastName, email, joinedOn } = user;
    res.json({ name: firstName });
  });
}

/**
 * Encodes jwt based on id of the logged in user and response sends back this token
 * @module login
 * @param {Object}    req   - Express request object
 * @param {Object}    res   - Express response object
 * @param {Function}  next  - Express next middleware function
 */
module.exports.login = function(req, res, next) {
  const token = tokenForUser(req.user);
  User.findOne(req.user, function(err, user) {
    if (err) return next(err);
    res.send({ token });
  });
}

/**
 * First checks if all fields required for each user are non-empty, and that a valid
 * email is provided. Then checks if a user exists with the same email, and if not,
 * creates the user, and responds with a token for the new user.
 * @module signup
 * @param {Object}    req   - Express request object
 * @param {Object}    res   - Express response object
 * @param {Function}  next  - Express next middleware function
 */
module.exports.signup = function(req, res, next) {
  const { firstName, lastName, email, password } = req.body;
  if (!firstName) return res.status(422).send({ error: authErrors.missing.firstName });
  if (!lastName) return res.status(422).send({ error: authErrors.missing.lastName })
  if (!email) return res.status(422).send({ error: authErrors.missing.email });
  if (!password) return res.status(422).send({ error: authErrors.missing.password });
  if (!verify.email(email)) return res.status(422).send({ error: authErrors.invalid.email });

  /* Checks if user exists given an email */
  User.findOne({ email }, function(err, existingUser) {
    if (err) return next(err);

    /* If a user with email does exist, return an error */
    if (existingUser) {
      return res.status(422).send({ error: authErrors.duplicate.email });
    }

    /* If a user with email does not exist, create and save user record */
    let user = new User({ firstName, lastName, email, password });

    user.save(function(err) {
      if (err) return next(err);

      /* Repond to request with token, indicating the user was created */
      const token = tokenForUser(user)
      res.json({ token });
    });
  });
}