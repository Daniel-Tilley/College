'use strict';
module.exports = {
  up: function(queryInterface, Sequelize) {
    return queryInterface.createTable('customers', {
      customerid: {
        type: Sequelize.INTEGER,
        primaryKey: true,
      },
      firstname: {
        type: Sequelize.STRING
      },
      lastname: {
        type: Sequelize.STRING
      },
      address1: {
        type: Sequelize.STRING
      },
      address2: {
        type: Sequelize.STRING
      },
      city: {
        type: Sequelize.STRING
      },
      state: {
        type: Sequelize.STRING
      },
      zip: {
        type: Sequelize.INTEGER
      },
      country: {
        type: Sequelize.STRING
      },
      region: {
        type: Sequelize.INTEGER
      },
      email: {
        type: Sequelize.STRING
      },
      phone: {
        type: Sequelize.STRING
      },
      creditcardtype: {
        type: Sequelize.INTEGER
      },
      creditcard: {
        type: Sequelize.STRING
      },
      creditcardexpiration: {
        type: Sequelize.STRING
      },
      username: {
        type: Sequelize.STRING
      },
      password: {
        type: Sequelize.STRING
      },
      age: {
        type: Sequelize.INTEGER
      },
      income: {
        type: Sequelize.INTEGER
      },
      gender: {
        type: Sequelize.STRING
      }
    }, {
      schema: 'postgraphile'
    });
  },
  down: function(queryInterface, Sequelize) {
    return queryInterface.dropTable('customers');
  }
};
