'use strict';
module.exports = function(sequelize, DataTypes) {
  var customers = sequelize.define('customers', {
    customerid: { type: DataTypes.INTEGER,  primaryKey: true},
    firstname: DataTypes.STRING,
    lastname: DataTypes.STRING,
    address1: DataTypes.STRING,
    address2: DataTypes.STRING,
    city: DataTypes.STRING,
    state: DataTypes.STRING,
    zip: DataTypes.INTEGER,
    country: DataTypes.STRING,
    region: DataTypes.INTEGER,
    email: DataTypes.STRING,
    phone: DataTypes.STRING,
    creditcardtype: DataTypes.INTEGER,
    creditcard: DataTypes.STRING,
    creditcardexpiration: DataTypes.STRING,
    username: DataTypes.STRING,
    password: DataTypes.STRING,
    age: DataTypes.INTEGER,
    income: DataTypes.INTEGER,
    gender: DataTypes.STRING
  }, {
    schema: 'postgraphile',
    timestamps: false
  });
  return customers;
};
