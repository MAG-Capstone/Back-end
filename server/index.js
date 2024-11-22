const express = require('express');
const {Server} = require('ws');

const PORT = process.env.PORT || 3000;

const app = express();

app.get('/', (req, res) => {
  res.send('WebSocket Server is running!'); 
});


const server = app.listen(PORT, () => {
  console.log(`Server is listening on http://localhost:${PORT}`);
});

const wss = new Server({server});

wss.on('connection', ws => {
  console.log('Client connected');
  ws.on('message', message => console.log(`Received: ${message}`));
  ws.on('close', () => console.log('Client disconnected'));
});