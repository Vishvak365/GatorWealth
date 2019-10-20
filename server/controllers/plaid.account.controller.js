const config = require('../config/config');
const plaid = require('plaid');

const PlaidAccount = require('../models/plaid.account.model');

let PUBLIC_TOKEN = null;
let ACCESS_TOKEN = null;
let ITEM_ID = null;

const { client_id, public_key, secret } = config.plaid;

const client = new plaid.Client(
  client_id,
  secret,
  public_key,
  plaid.environments.sandbox,
  { version: '2018-05-22' },
);

module.exports.createPublicToken = function(req, res, next) {
  // client.createPublicToken(ACCESS_TOKEN, )
}

module.exports.addAccount = function(req, res, next) {
  PUBLIC_TOKEN = req.body.public_token;
  
  const userId = req.user.email;
  const institution = req.body.metadata.institution;
  const { name, institution_id } = institution;

  if (PUBLIC_TOKEN) {
    client.exchangePublicToken(PUBLIC_TOKEN).then(exchangeResponse => {
      ACCESS_TOKEN = exchangeResponse.access_token;
      ITEM_ID = exchangeResponse.item_id;
    });
  }

  PlaidAccount.findOne({ userId: req.user.email, institutionId: institution_id }, function(req, res, next) {
    if (err) return next(err);
    const account = new PlaidAccount({
      userId: userId,
      access_token: ACCESS_TOKEN,
      itemId: ITEM_ID,
      institutionId: institution_id,
      institutionName: name
    });
    account.save(function(err) {
      if (err) return next(err);
      return res.json({ account });
    });
  });
};