'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('purchases', [{
        name: 'Test',
        address: 'test',
        state: 'TT',
        zipcode: 12345,
        user_id: 1,
        created_at: new Date(),
        updated_at: new Date()
    }], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('purchases', { where: { name: 'Test' } }, {});
  }
};
