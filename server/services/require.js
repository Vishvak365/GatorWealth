const passport = require('passport');

module.exports.auth = passport.authenticate('jwt', { session: false });
module.exports.login = passport.authenticate('local', { session: false });