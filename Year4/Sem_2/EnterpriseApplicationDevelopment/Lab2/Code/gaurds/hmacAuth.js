const crypto = require("crypto-js");

const config = require('../config.js');
const responseHelper = require('../helpers/responseHelper');
const requestHelper = require('../helpers/requestHelper');

module.exports = (req, res, next) => {

  // Check if client HMAC present
  if(req.headers.authorization) {
    // Get client HMAC
    var clientHMAC = requestHelper.getClientHMAC(req);

    // Find user in db using key
    req.app.get('db').users.find({
      'key': clientHMAC.Key
    })
    .then(items => {

      // If user does not exist
      if (items.length === 0) {
        responseHelper.sendUnauthorisedResponse(res, "Key is incorrect");
      }
      else{
         var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl;

        // Generate server signature to compare
        var serverSignature = crypto.HmacSHA256(
          items[0].username + ' ' + items[0].key + ' ' + fullUrl,
          items[0].secret_key
        );

        // Check two signatures
        if (serverSignature.toString() === clientHMAC.Signature) {
          // Set current user (optional, can be used to print name in calling method)
          req.user = items[0].username;

          // Return to calling function
          next();
        } else {
          responseHelper.sendUnauthorisedResponse(res, "Signatures do not match");
        }
      }
    }).catch(error => {
      console.error(error);
      responseHelper.sendDefaultErrorResponse(res);
    });
  }else {
    return responseHelper.sendUnauthorisedResponse(res, "No token provided");
  }

  return;
};
