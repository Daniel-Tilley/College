import {
    GraphQLObjectType,
    GraphQLString,
    GraphQLID,
    GraphQLList
} from 'graphql';

import models from '../../../models/index';

export default new GraphQLObjectType({
    name: 'customers',
    description: 'a customer',
    fields () {
        return {
            customerid: {
                type: GraphQLID,
                description: "customers ID",
                resolve (customer) {
                    return customer.customerid;
                }
            },
            firstname: {
                type: GraphQLString,
                description: "customers firstname",
                resolve (customer) {
                    return customer.firstname;
                }
            },
            lastname: {
                type: GraphQLString,
                description: "customers lastname",
                resolve (customer) {
                    return customer.lastname;
                }
            },
            address1: {
                type: GraphQLString,
                description: "customers address1",
                resolve (customer) {
                    return customer.address1;
                }
            },
            address2: {
                type: GraphQLString,
                description: "customers address2",
                resolve (customer) {
                    return customer.address2;
                }
            },
            city: {
                type: GraphQLString,
                description: "customers city",
                resolve (customer) {
                    return customer.city;
                }
            },
            state: {
                type: GraphQLString,
                description: "customers state",
                resolve (customer) {
                    return customer.state;
                }
            },
            zip: {
                type: GraphQLID,
                description: "customers zip",
                resolve (customer) {
                    return customer.zip;
                }
            },
            country: {
                type: GraphQLString,
                description: "customers country",
                resolve (customer) {
                    return customer.country;
                }
            },
            region: {
                type: GraphQLID,
                description: "customers region",
                resolve (customer) {
                    return customer.region;
                }
            },
            email: {
                type: GraphQLString,
                description: "customers email",
                resolve (customer) {
                    return customer.email;
                }
            },
            phone: {
                type: GraphQLString,
                description: "customers phone",
                resolve (customer) {
                    return customer.phone;
                }
            },
            creditcardtype: {
                type: GraphQLID,
                description: "customers creditcardtype",
                resolve (customer) {
                    return customer.creditcardtype;
                }
            },
            creditcard: {
                type: GraphQLString,
                description: "customers creditcard",
                resolve (customer) {
                    return customer.creditcard;
                }
            },
            creditcardexpiration: {
                type: GraphQLString,
                description: "customers creditcardexpiration",
                resolve (customer) {
                    return customer.creditcardexpiration;
                }
            },
            username: {
                type: GraphQLString,
                description: "customers username",
                resolve (customer) {
                    return customer.username;
                }
            },
            password: {
                type: GraphQLString,
                description: "customers password",
                resolve (customer) {
                    return customer.password;
                }
            },
            age: {
                type: GraphQLID,
                description: "customers age",
                resolve (customer) {
                    return customer.age;
                }
            },
            income: {
                type: GraphQLID,
                description: "customers income",
                resolve (customer) {
                    return customer.income;
                }
            },
            gender: {
                type: GraphQLString,
                description: "customers gender",
                resolve (customer) {
                    return customer.gender;
                }
            },
            fullName: {
                type: GraphQLString,
                description: "customers full name",
                resolve (customer) {
                    return customer.firstname + " " + customer.lastname;
                }
            }
        };
    }
});
