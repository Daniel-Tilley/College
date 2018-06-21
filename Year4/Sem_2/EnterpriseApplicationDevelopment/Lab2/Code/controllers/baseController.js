const responseHelper = require('../helpers/responseHelper.js');

// USED IN THE BASE ROUTE OF ROUTES.JS

exports.getWelcomeMessage = (req, res) => {
  responseHelper.sendOkResponseNoData(res, "Lab 2");
};
