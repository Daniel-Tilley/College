const auth = require('basic-auth');

exports.getClientHMAC = (req) => {
  var token = req.headers.authorization.split(' ');
  var key = token[1].split('=');
  var clientSignature = token[2].split('=');

  return {"Key": key[1], "Signature": clientSignature[1]};
}

exports.getBasicAuthUser = (req) => {
  return auth(req);
}
