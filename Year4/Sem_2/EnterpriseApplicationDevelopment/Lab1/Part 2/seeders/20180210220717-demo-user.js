'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      return queryInterface.bulkInsert('users', [{
          email: 'Test@test.com',
          password: '123456789',
          details: '"sex"=>"m"',
          created_at: new Date(),
          updated_at: new Date()
      }], {});
  },

  down: (queryInterface, Sequelize) => {
      return queryInterface.bulkDelete('users', { where: { email: 'Test@test.com' } }, {});
  }
};
