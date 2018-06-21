module.exports = function(app) {
	var baseController = require('./controllers/baseController.js');
	var userController = require('./controllers/userController.js');
	var productController = require('./controllers/productController.js');
	var authController = require('./controllers/authController.js');

//----------------------------------------------------------------------------------
	app.route('/')
	.get(baseController.getWelcomeMessage);

//----------------------------------------------------------------------------------
	// Auth routes
	app.route('/auth/jwt/login')
		.get(authController.loginUserJWT);

//----------------------------------------------------------------------------------
	// Basic Auth Routes
	app.route('/basic/users')
		.get(userController.getAllUsers);

	app.route('/basic/products')
		.get(productController.getAllProducts);

//----------------------------------------------------------------------------------
	// JWT Routes
	app.route('/jwt/users')
		.get(userController.getAllUsers);

	app.route('/jwt/products')
		.get(productController.getAllProducts);

//----------------------------------------------------------------------------------
	// HMAC Routes
	app.route('/hmac/users')
		.get(userController.getAllUsers);

	app.route('/hmac/products')
		.get(productController.getAllProducts);
};
