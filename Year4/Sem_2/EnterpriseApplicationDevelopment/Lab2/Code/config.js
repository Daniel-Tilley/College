const fs = require("fs");

module.exports = {
  DB_HOST: '127.0.0.1',
  DB_PORT: 5432,
  DB_NAME: 'lab2',
  DB_USER: 'daniel',
  DB_PASSWORD: 'Daniel1996',
  APP_PORT: 3000,
  APP_BASE_URL: 'http://localhost:3000/',
  JWT_SECRET: 'ThisIsAReallyBadSecret', // Can be used as an alternative to public and private keys
  PRIVATE_KEY: fs.readFileSync("./keys/lab2.key"),
  PUBLIC_KEY: fs.readFileSync("./keys/lab2.key.pub")
}
