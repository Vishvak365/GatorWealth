const mongoose = require('mongoose');
const bcrypt = require('bcrypt-nodejs');

const Schema = mongoose.Schema;
const SALT_WORK_FACTOR = 10;

/**
 * User Schema
 * Date is stored in milliseconds since January 1, 1970, 00:00:00 UTC
 * @constructor User
 */
const userSchema = new Schema({
  firstName: { type: String, required: true, lowercase: true },
  lastName: { type: String, required: true, lowercase: true },
  email: { type: String, unique: true, required: true, lowercase: true },
  password: { type: String, required: true },
  joinedOn: { type: Number, default: Date.now },
});

/**
 * Callback which handles what to do if passwords do/do not match (in passport)
 * @callback hashSaltCallback
 * @param {Error}   [err]   - Error for hashing
 * @param {String}  [hash]  - String representing the hashed password
 */

/**
 * Compare given password to password of user (salted -> hashed passwords)
 * @param {String} candidatePassword - Password to be hashed and compared with
 * @param {hashSaltCallback} callback - Callback for response
 */
userSchema.methods.encryptPassword = function(password, callback) {
  /* Generate a salt */
  bcrypt.genSalt(SALT_WORK_FACTOR, function(err, salt) {
    if (err) return callback(err);

    /* Hash (encrypt) the password using the salt */
    bcrypt.hash(password, salt, null, function(err, hash) {
      if (err) return callback(err);
      callback(null, hash);
    });
  });
};

/**
 * Callback which handles what to do if passwords do/do not match (in passport)
 * @callback compareCallback
 * @param {Error}   [err]     - Error for compare method
 * @param {Boolean} [isMatch] - True if passwords match, false if not
 */

/**
 * Compare given password to password of user (salted -> hashed passwords)
 * @param {String} candidatePassword - Password to be hashed and compared with
 * @param {compareCallback} callback - Callback for response
 */
userSchema.methods.comparePassword = function(candidatePassword, callback) {
  bcrypt.compare(candidatePassword, this.password, function(err, isMatch) {
    if (err) return callback(err);
    callback(null, isMatch);
  });
}

userSchema.pre('save', function(next) {
  /* Gets access to the user model */
  const user = this;

  /* Encrypt the user's password */
  user.encryptPassword(user.password, function(err, password) {
    if (err) return next(err);
    
    /* Overwrite plain text password with encrypted password */
    user.password = password;
    next();
  });
});

/* Create the model class */
const User = mongoose.model('user', userSchema);

module.exports = User;