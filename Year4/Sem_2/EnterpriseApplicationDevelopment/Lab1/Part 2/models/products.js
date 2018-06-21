'use strict';
module.exports = (sequelize, DataTypes) => {
  var products = sequelize.define('products', {
    title: DataTypes.STRING,
    price: DataTypes.FLOAT,
    tags: DataTypes.ARRAY(DataTypes.STRING)
  }, {
    underscored: true,
    classMethods: {
      associate: function(models) { }
    }
  });
  return products;
};