const config = require('../config.js');
const responseHelper = require('../helpers/responseHelper');
const requestHelper = require('../helpers/requestHelper');

// USED TO AUTHENTICATE A USER VIA BASIC AUTH

module.exports = (req, res, next) => {
  var user = requestHelper.getBasicAuthUser(req);

  // Check if basic auth is included in the headers
  if (!user) {
    return responseHelper.sendUnauthorisedResponse(res, "User data not provided");
  } else {
    var userSql = "SELECT * FROM users where username = $1 AND password = crypt($2, password);";

    // Get user from db
    req.app.get('db').run(userSql, [user.name, user.pass])
    .then( items => {

      // If user does not exist
      if (items.length === 0) {
        responseHelper.sendUnauthorisedResponse(res, "Username / Password are incorrect");
      }
      else{
        // Set current user (optional, can be used to print name in calling method)
        req.user = user.name;

        // Return to calling function
        next();
      }
    })
    .catch( error => {
      console.log(error);
      responseHelper.sendDefaultErrorResponse(res);
    });
  }

  return;
};
