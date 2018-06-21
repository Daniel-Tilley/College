exports.sendCustomResponseNoData = (res, code, status, message) => {
  res.status(code).json({
    "status": status,
    "message": message
  });
};

exports.sendCustomResponse = (res, code, status, message, data) => {
  res.status(code).json({
    "status": status,
    "message": message,
    "data": data
  });
};

exports.sendOkResponseNoData = (res, message, data) => {
  res.status(200).json({
    "status": "Ok",
    "message": message
  });
};

exports.sendOkResponse = (res, message, data) => {
  res.status(200).json({
    "status": "Ok",
    "message": message,
    "data": data
  });
};

exports.sendCreatedResponse = (res, message) => {
  res.status(201).json({
    "status": "Created",
    "message": message
  });
};

exports.sendNoContentResponse = (res, message) => {
  res.status(204).json({
    "status": "No Content",
    "message": message
  });
};

exports.sendUnauthorisedResponse = (res, message) => {
  res.status(401).json({
    "status": "Unauthorised",
    "message": message
  });
};

exports.sendNotFoundResponse = (res, message) => {
  res.status(404).json({
    "status": "Not Found",
    "message": message
  });
};

exports.sendDefaultErrorResponse = (res) => {
  res.status(500).json({
    "status": "Error",
    "message": "An error has occured, please try again"
  });
};

exports.sendErrorResponse = (res, message) => {
  res.status(500).json({
    "status": "Error",
    "message": message
  });
};
