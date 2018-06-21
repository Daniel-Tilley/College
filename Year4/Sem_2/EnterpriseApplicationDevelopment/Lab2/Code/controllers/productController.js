const responseHelper = require('../helpers/responseHelper');

// USED IN THE PRODUCTS ROUTES IN ROUTES.JS

exports.getAllProducts = (req, res) => {
  req.app.get('db').products.find({})
  .then(items => {
    responseHelper.sendOkResponse(res, null, items);
  }).catch(error => {
    console.error(error);
    responseHelper.sendDefaultErrorResponse(res);
  });
};
