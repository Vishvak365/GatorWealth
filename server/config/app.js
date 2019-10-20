const config = require('./config');
const express = require('./express');

/* Initializes express app, and listens on configuration port */
module.exports.start = () => {
  const app = express.init();
  const port = config.port;
  app.listen(port, () => console.log(`App listening on port ${port}`));
};