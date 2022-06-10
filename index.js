const express = require('express');
const exphbs = require('express-handlebars');
const session = require('express-session');
const fileUpload = require('express-fileupload');
const multer = require('multer');
const bcrypt = require('bcryptjs');


// import sqlite modules
const sqlite3 = require('sqlite3');
const { open } = require('sqlite');
const e = require('express');

const app = express();
// default option
app.use(fileUpload());
const PORT = process.env.PORT || 3017;

// enable the req.body object - to allow us to use HTML forms
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// enable the static folder...
app.use(express.static('public'));

// add more middleware to allow for templating support
app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.use(session({
	secret: 'keyboard cat',
	resave: false,
	saveUninitialized: true
}));

// database setup starts here
open({
	filename: './mandata.db',
	driver: sqlite3.Database
}).then(async (db) => {

	// only setup the routes once the database connection has been established

	await db.migrate();

	app.get('/', async function (req, res) {
		//const counter = await db.get('select * from counter');
		const users = await db.all('select * from users');
		res.render('index', {
			//counter: counter ? counter.count : 0
			users
		});
	});

	app.post("/register", async function (req, res) {
		try {
			var fullname = req.body.fullname;
			var email = req.body.email;
			var address = req.body.address;
			var gender = req.body.gender;
			var dob = req.body.dob;
			var doj = req.body.doj;
			var description = req.body.description;
			var type = req.body.type;
			var picture = req.file.buffer.toString('base64');


			var hash = await bcrypt.hash(password, 10);
			var insert_users = 'insert into users (fullname, email, address, gender, dob, doj, description, type, picture, hash) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
			await db.run(insert_users,fullname, email, address, gender, dob, doj, description, type, picture, hash);
			res.redirect('/');

		} catch (e) {
			console.log(e);
			res.status(500).send("incorrect information!");
			res.redirect('/');
		}
	});

	app.post("/", async function (req, res) {
		try {
			const fullname = req.body.fullname;
			const email = req.body.email;
			const password = req.body.password;

			const user = await db.get('select * from users where email = ?', email);
			if (user) {
				const vaildPass = await bcrypt.compare(password, user.hash);
				if (vaildPass) {
					console.log("in");
					res.redirect('/home');
				} else {
					res.redirect('/');
					console.log("out");
				}
			} else {
				console.log("user not fownd");
			}

		} catch (e) {
			console.log(e);
		}
	});

	app.get('/home', async function (req, res) {
		const users = await db.all('select * from users');
		res.render('home', {
			users
		});
	});

	app.get('/register',function (req, res) {
		res.render("register");
	});

	app.post('/register', async function (req, res) {
		res.redirect("/register");
	});



	// start  the server and start listening for HTTP request on the PORT number specified...
	app.listen(PORT, function () {
		console.log(`App started on port ${PORT}`)
	});

});