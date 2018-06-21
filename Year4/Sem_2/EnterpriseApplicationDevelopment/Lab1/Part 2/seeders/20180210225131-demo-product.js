'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('products', [{
        title: 'test',
        price: 7.99,
        tags: '{"test", "book"}',
        created_at: new Date(),
        updated_at: new Date()
    }], {});
  },

  down: (queryInterface, Sequelize) => {
      return queryInterface.bulkDelete('products', { where: { title: 'test' } }, {});
  }
};
