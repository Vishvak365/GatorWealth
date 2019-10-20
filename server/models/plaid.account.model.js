const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const plaidAccountSchema = new Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref: 'user',
  },
  accessToken: {
    type: String,
    required: true,
  },
  itemId: {
    type: String,
    required: true,
  },
  institutionId: {
    type: String,
    required: true,
  },
  institutionName: {
    type: String,
  },
  accountName: {
    type: String,
  },
  accountType: {
    type: String,
  },
  accountSubtype: {
    type: String,
  },
});

const PlaidAccount = mongoose.model('PlaidAccount', plaidAccountSchema);

module.exports = PlaidAccount;