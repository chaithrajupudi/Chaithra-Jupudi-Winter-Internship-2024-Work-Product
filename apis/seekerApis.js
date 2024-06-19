const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');

const app = express();
app.use(bodyParser.json());

app.post('/search', (req, res) => {
    const product = req.body.product;
    
    axios.post('http://localhost:3001/on_search', { product })
    .then(response => {
        res.json(response.data);
    })
    .catch(error => {
        res.status(500).json({ error: 'Internal Server Error' });
    });
});

app.post('/category', (req, res) => {
    const category = req.body.category;
    
    axios.post('http://localhost:3001/on_category', { category })
    .then(response => {
        res.json(response.data);
    })
    .catch(error => {
        res.status(500).json({ error: 'Internal Server Error' });
    });
});


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Seeker APIs are running on port ${PORT}`);
});
