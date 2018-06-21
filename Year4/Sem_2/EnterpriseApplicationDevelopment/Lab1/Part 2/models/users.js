'use strict';
module.exports = (sequelize, DataTypes) => {
  var users = sequelize.define('users', {
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    details: DataTypes.STRING
  }, {
    underscored: true,
    classMethods: {
      associate: function(models) { }
    }
  });
  return users;
};