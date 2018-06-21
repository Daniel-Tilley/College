const app = require('./server.js');
const config = require('./config.js');

// ENTRY POINT INTO THE APPLICATION

app.listen(config.APP_PORT, () => {
  console.log("Server running on port: " + config.APP_PORT);
});
