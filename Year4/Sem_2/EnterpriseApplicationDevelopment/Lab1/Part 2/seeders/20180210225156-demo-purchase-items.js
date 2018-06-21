'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('purchase_items', [{
        purchase_id: 1000,
        product_id: 1,
        price: 9.99,
        quantity: 1000,
        state: 'Delivered',
        created_at: new Date(),
        updated_at: new Date()
    }], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('purchase_I=items', { where: { quantity: 1000 } }, {});
  }
};
