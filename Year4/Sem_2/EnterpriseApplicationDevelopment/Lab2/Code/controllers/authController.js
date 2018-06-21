const jwt = require('jsonwebtoken');
const auth = require('basic-auth');

const responseHelper = require('../helpers/responseHelper');
const config = require('../config.js');

// USED IN THE LOGIN ROUTE FOR JWT IN ROUTES.JS

exports.loginUserJWT  = function(req, res) {
  var user = auth(req);

  // Check for user basic auth header
  if (!user){
    responseHelper.sendUnauthorisedResponse(res, "Login details not provided");
  } else {
    var userSql = "SELECT * FROM users where username = $1 AND password = crypt($2, password);";

    // Get user from db
    req.app.get('db').run(userSql, [user.name, user.pass])
    .then( items => {

      // Check user exists
      if (items.length !== 0) {

        // Create token and sign with private key
        token = jwt.sign(
          { id: user.name },
          config.PRIVATE_KEY,
          {
            algorithm: 'RS256',
            issuer: 'http://localhost:3000/',
            expiresIn: '1h'
          }
        );
        responseHelper.sendOkResponse(res, null, token);
      }
      else {
        responseHelper.sendUnauthorisedResponse(res, "Username / Password are incorrect");
      }
    })
    .catch( error => {
      console.log(error);
      responseHelper.sendDefaultErrorResponse(res);
    });
  }
};
