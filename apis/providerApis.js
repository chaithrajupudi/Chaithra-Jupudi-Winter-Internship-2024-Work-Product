const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const { Pool } = require('pg');
const { Connector } = require('@google-cloud/cloud-sql-connector');
require('dotenv').config();

const app = express();
app.use(bodyParser.json());

// Configure Cloud SQL connection
const connector = new Connector();
const poolPromise = connector.getOptions({
  instanceConnectionName: process.env.INSTANCE_CONNECTION_NAME,
  ipType: process.env.IP_TYPE,
}).then(clientOpts => {
  return new Pool({
    ...clientOpts,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    max: 5,
  });
}).catch(err => {
  console.error('Error connecting to Cloud SQL:', err);
  process.exit(1);
});


app.post('/on_search', async (req, res) => {
  const product = req.body.product;
  
  try {
    const pool = await poolPromise;
    const queryText = 'SELECT * FROM items WHERE name ILIKE $1';
    const { rows } = await pool.query(queryText, [`%${product}%`]);
    res.json(rows);
  } catch (error) {
    console.error('Error executing query:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post('/on_category', async (req, res) => {
    const category = req.body.category;
    
    try {
      const pool = await poolPromise;
      const queryText = 'SELECT * FROM items WHERE category ILIKE $1';
      const { rows } = await pool.query(queryText, [`%${category}%`]);
      res.json(rows);
    } catch (error) {
      console.error('Error executing query:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Provider APIs are running on port ${PORT}`);
});
