// index.js
// Entry point del server Node.js

const express = require('express');                 // framework REST
const fileUpload = require('express-fileupload');  // upload immagini
const swaggerUi = require('swagger-ui-express');   // swagger UI

const app = express();
const port = 3000;

// Middleware base
app.use(express.json()); 
app.use(express.urlencoded({ extended: true }));
app.use(fileUpload());

// Avvio server
app.listen(port, () => {
  console.log(`Server avviato sulla porta ${port}`);
});

// Endpoint base di test
app.get('/', (req, res) => {
  res.json({ info: 'Social Network API - Node.js, Express, PostgreSQL' });
});

// Swagger
const swaggerFile = require('./swagger-output.json');
app.use('/doc', swaggerUi.serve, swaggerUi.setup(swaggerFile));

// Caricamento endpoints
require('./endpoints')(app);
