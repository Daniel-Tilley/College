const responseHelper = require('../helpers/responseHelper');

// USED IN THE USERS ROUTES IN ROUTES.JS

exports.getAllUsers = (req, res) => {
  req.app.get('db').users.find({})
  .then(items => {
    responseHelper.sendOkResponse(res, null, items);
  }).catch(error => {
    console.error(error);
    responseHelper.sendDefaultErrorResponse(res);
  });
};
