### Reference
socket 
https://socket.io/

socket.io-redis-adapter
https://github.com/socketio/socket.io-redis-adapter

### Example
Install:
```
npm install @socket.io/redis-adapter redis
```

Command:
```
// npm i -D redis @types/redis
import { Server } from 'socket.io';
import { createAdapter } from '@socket.io/redis-adapter';
import { RedisClient } from 'redis';

const io = new Server(8080);
const pubClient = new RedisClient({ host: 'localhost', port: 6379 });
const subClient = pubClient.duplicate();

io.adapter(createAdapter(pubClient, subClient));

io.emit('hello', 'to all clients');
io.to('room42').emit('hello', "to all clients in 'room42' room");

io.on('connection', (socket) => {
  socket.broadcast.emit('hello', 'to all clients except sender');
  socket.to('room42').emit('hello', "to all clients in 'room42' room except sender");
});
```
