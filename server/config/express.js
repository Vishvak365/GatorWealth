const morgan = require('morgan');
const config = require('./config');
const express = require('express');
const router = require('../routes');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

module.exports.init = () => {
  /* Connect to Database */
  mongoose.Promise = global.Promise;
  mongoose.connect(config.db.uri, { useNewUrlParser: true, useUnifiedTopology: true });
  mongoose.set('useCreateIndex', true);

  /* Initialize app */
  const app = express();

  /* Enable request logging for development debugging */
  app.use(morgan('dev'));

  /* Body parsing middleware */
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: true }));

  app.use('/user', router.user);
  app.use('/plaid', router.plaid);
  app.use('/transactions', router.transactions);

  return app;
};