'use strict';
module.exports = (sequelize, DataTypes) => {
  var purchases = sequelize.define('purchases', {
    name: DataTypes.STRING,
    address: DataTypes.STRING,
    state: DataTypes.STRING,
    zipcode: DataTypes.INTEGER
  }, {
    underscored: true,
    classMethods: {
      associate: function(models) {
        purchases.hasMany(models.users);
      }
    }
  });
  return purchases;
};