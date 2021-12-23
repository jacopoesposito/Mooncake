var express = require('express');
var app = express();
app.use(express.static(__dirname));
app.listen('3300');
console.log('Running at\nhttp://localhost:3300');

app.get('/', (req, res) => {
    res.sendFile('./src/index.html', { root: __dirname });
});