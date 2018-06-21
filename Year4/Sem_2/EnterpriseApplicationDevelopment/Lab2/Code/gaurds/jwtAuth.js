const jwt = require('jsonwebtoken');

const config = require('../config.js');
const responseHelper = require('../helpers/responseHelper');

module.exports = (req, res, next) => {

  // Check if token in header
  if(req.token) {
    try {
      // Verify token
      var token = jwt.verify(req.token, config.PUBLIC_KEY, { algorithms: ['RS256'] });

      // Set current user (optional, can be used to print name in calling method)
      req.user = token.id;

      // Return to calling function
      next();
    } catch(err) {
      console.log(err);
      return responseHelper.sendUnauthorisedResponse(res, "Failed to authenticate token");
    }
  }else {
    return responseHelper.sendUnauthorisedResponse(res, "No token provided");
  }

  return;
};
