/**
 * Error messages for missing user data
 * @namespace
 * @property {String} firstName - Error message for missing first name
 * @property {String} lastName  - Error message for missing last name
 * @property {String} email     - Error message for missing email
 * @property {String} password  - Error message for missing password
 */
module.exports.missing = {
  firstName: 'You must provide your first name',
  lastName: 'You must provide your last name',
  email: 'You must provide your email',
  password: 'You must provide your password',
};

/**
 * Error messages for invalid user data
 * @namespace
 * @property {String} email     - Error message for invalid email
 * @property {String} password  - Error message for invalid password
 */
module.exports.invalid = {
  email: 'You must provide a valid email format',
  password: 'Passwords must contain a lowercase letter, uppercase letter, and a number',
}

/**
 * Error messages for duplicated user data (unique property)
 * @namespace
 * @property {String} email - Error message for duplicate email
 */
module.exports.duplicate = {
  email: 'Email is already in use',
}