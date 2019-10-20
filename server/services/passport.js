const passport = require('passport');
const config = require('../config/config');
const User = require('../models/user.model');
const LocalStrategy = require('passport-local');
const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt;

/* Create local strategy */
const localOptions = { usernameField: 'email' };
const localLogin = new LocalStrategy(localOptions, function(email, password, done) {
  /**
   * Verify this email and password, call done with the user if it is the
   * correct email and password.
   * Otherwise, call done with false
   */
  User.findOne({ email }, function(err, user) {
    if (err) return done(err);
    if (!user) return done(null, false);

    /* Compare passwords */
    user.comparePassword(password, function(err, isMatch) {
      if (err) return done(err);
      if (!isMatch) return done(null, false);

      return done(null, user);
    });
  });
});

/**
 * Setup options for JWT Strategy
 * @namespace
 * @property {String} jwtFromRequest  - JSON web token currently set in the header
 * @property {String} secretOrKey     - Secret key for encryptying info -> token
 */
const jwtOptions = {
  jwtFromRequest: ExtractJwt.fromHeader('authorization'),
  secretOrKey: config.secret
};

/* Create JWT strategy */
const jwtLogin = new JwtStrategy(jwtOptions, function(payload, done) {
  /**
   * See if the user ID in the payload exists in our database
   * If it does, call 'done' with that other
   * otherwise, call done without a user object
   */
  User.findById(payload.sub, function(err, user) {
    if (err) return done(err, false);

    if (user) done(null, user);
    else done(null, false);
  });
});

/* Tell passport to use this strategy */
passport.use(jwtLogin);
passport.use(localLogin);