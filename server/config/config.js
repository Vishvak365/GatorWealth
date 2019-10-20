module.exports = {
  db: {
    uri: 'mongodb://admin:hackfsu2019@ds151814.mlab.com:51814/hackfsu-2019',
  },
  port: process.env.PORT || 8080,
  test: {
    port: 8080
  },
  secret: process.env.SECRET,
  plaid: {
    client_id: process.env.PLAID_CLIENT_ID,
    public_key: process.env.PLAID_PUBLIC_KEY,
    secret: process.env.PLAID_SECRET,
  },
};