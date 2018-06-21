'use strict';
module.exports = (sequelize, DataTypes) => {
  var purchase_items = sequelize.define('purchase_items', {
    price: DataTypes.FLOAT,
    quantity: DataTypes.INTEGER,
    state: DataTypes.STRING
  }, {
    underscored: true,
    classMethods: {
      associate: function(models) {
        purchase_items.hasMany(models.products);
        purchase_items.hasMany(models.purchases);
      }
    }
  });
  return purchase_items;
};