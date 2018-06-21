import {
  GraphQLList,
  GraphQLID,
  GraphQLString,
  GraphQLNonNull
} from 'graphql';

import models from '../../../models/index';
import Customer from '../types/customer';

export default {
    type: new GraphQLList(Customer),
    args: {
      first: {
        type: GraphQLID
      }
    },
    resolve(root, args) {
        return models.customers.findAll({limit: args.first});
    }
};
