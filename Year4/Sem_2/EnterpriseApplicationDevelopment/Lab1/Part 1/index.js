const express = require('express');
const http = require('http');
const massive = require('massive');
const app = express();

var hstore = require('pg-hstore')();


massive({
  host: '127.0.0.1',
  port: 5432,
  database: 'pgguide',
  user: 'daniel',
  password: 'Daniel1996'
}).then(instance => {

  app.set('db', instance);

//-----------------------------------------------------------------------

  // Base route
  app.get('/', (req, res) => {

  res.send("Lab 1");
  });

//-----------------------------------------------------------------------

  // Get all users
  app.get('/users', (req, res) => {

    req.app.get('db').users.find({},{
      fields: ['email', 'details'],
      order: 'created_at desc'
    }).then(items => {
      res.json(items.map(function (el){
        var details;

        try{
          hstore.parse(el.details, function(result) {
            details = result;
          });
        }catch(err){
          details = {"sex" : null};
        }

        return {"email": el.email, "sex": details.sex}
      }));
    }).catch(error => {
      console.error(error);
      res.send("Error occurred, try again!");
    });
  });

//-----------------------------------------------------------------------

  // Get a specific user
  app.get('/users/:id', (req, res) => {

    req.app.get('db').users.find({
      'id': req.params.id
      },{
        fields: ['email', 'details'],
    }).then(items => {
      res.json(items.map(function (el){
        var details;

        try{
          hstore.parse(el.details, function(result) {
            details = result;
          });
        }catch(err){
          details = {"sex" : null};
        }

        return {"email": el.email, "sex": details.sex};
      }));
    }).catch(error => {
      console.error(error);
      res.send("Error occurred, try again!");
    });
  });

//-----------------------------------------------------------------------

  // Get all products
  app.get('/products', (req, res) => {
    const name = req.query.name;

    if (typeof name === 'undefined'){
      req.app.get('db').products.find({},{
        order: 'price asc'
      }).then(items => {
        res.json(items);
      }).catch(error => {
        console.error(error);
        res.send("Error occurred, try again!");
      });
    }

    else{
      req.app.get('db').query("SELECT * FROM products WHERE products.title LIKE " + "'" + name + "'")
      .then(items => {
        res.json(items);
      }).catch(error => {
        console.error(error);
        res.send("Error occurred, try again!");
      });

      /*

      // SOLUTION 1 - Parameters

      req.app.get('db').products.find({
        "title": name
      }).then(items => {
        res.json(items);
      }).catch(error => {
        console.error(error);
        res.send("Error occurred, try again!");
      });

      //SOLUTION 2 - Stored Procedure

      req.app.get('db').get_single_product(name).then(items => {
        res.json(items);
      }).catch(error => {
        console.error(error);
        res.send("Error occurred, try again!");
      });

      */
    }
  });

//-----------------------------------------------------------------------

  // Get product by id
  app.get('/products/:id', (req, res) => {

    req.app.get('db').products.find({
      'id': req.params.id
    }).then(items => {
      res.json(items);
    }).catch(error => {
      console.error(error);
      res.send("Error occurred, try again!");
    });
  });

//-----------------------------------------------------------------------

  // Get purchases
  app.get('/purchases', (req, res) => {

    req.app.get('db').query("\
      SELECT\
      purchases.name,\
      purchases.address,\
      users.email,\
      products.title,\
      products.price,\
      purchase_items.quantity,\
      purchase_items.state\
      FROM purchases\
      JOIN users ON purchases.user_id = users.id\
      JOIN purchase_items ON purchase_items.purchase_id = purchases.id\
      JOIN products ON purchase_items.product_id = products.id\
      ORDER BY products.price DESC")
    .then(items => {
      res.json(items);
    }).catch(error => {
      console.error(error);
      res.send("Error occurred, try again!");
    });
  });

//-----------------------------------------------------------------------

http.createServer(app).listen(3000);
});
