const express = require('express');
const router = express.Router();
const app = express();

const bodyParser = require('body-parser');
const massive = require('massive');
const bearerToken = require('express-bearer-token');

const config = require('./config.js');
const responseHelper = require('./helpers/responseHelper');

// Setup massive
massive({
  host: config.DB_HOST,
  port: config.DB_PORT,
  database: config.DB_NAME,
  user: config.DB_USER,
  password: config.DB_PASSWORD
}).then(instance => {
  app.set('db', instance);
});

// Use libraries
app.use(bodyParser.json());
app.use(bearerToken());

// Implement gaurds
app.use('/basic', require('./gaurds/basicAuth.js'));
app.use('/jwt', require('./gaurds/jwtAuth.js'));
app.use('/hmac', require('./gaurds/hmacAuth.js'));

// Apply routes
var routes = require('./routes.js');
routes(app);

app.use( (req, res) => {
  responseHelper.sendNotFoundResponse(res, "Page not found");
});

module.exports = app;
