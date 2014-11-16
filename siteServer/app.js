// Server code for site
var express = require('express')
var app = express()
var server = require('http').Server(app);
var io = require('socket.io')(server);
var net = require('net')

app.use("/", express.static(__dirname));
server.listen(8080);

// Socket.io events
io.sockets.on('connection', function(socket) {
	console.log("Someone connected!");
	socket.on('ready', function(data) {
		console.log("Receiveed ready, verifying ready");
		socket.emit('ready', {data: "hi"});
	});
	socket.on('picData',function(data){

		console.log("Now in socket.on picData");
		console.log(data);
		console.log("Data.data: " + data.data);
		var d = data.data;
		var HOST = d[d.length -2];
		var PORT = parseInt(d[d.length -1]);
		console.log("Host = " + HOST);
		console.log("PORT = " + PORT);
		var client = new net.Socket();
		client.connect(PORT, HOST, function() {
    	console.log('CONNECTED TO: ' + HOST + ':' + PORT);
			var newlist = []
			newlist[0] = (d[d.length-3]).toString();
			for (var i=0; i < d.length-3;i++){
				newlist[i+1] = d[i];
			}
			//client.write(d[d.length -3].toString());
			//client.write(' ');
			for (var i=0; i<newlist.length;i++){
    		client.write(newlist[i]);
				client.write(" ");
			}
			console.log("send success, all bytes sent");
			client.write("\n");
			client.destroy();
		});

		// Add a 'data' event handler for the client socket
		// data is what the server sent to this socket
		client.on('data', function(data) {
    	console.log('DATA: ' + data);
    	// Close the client socket completely
    	client.destroy();
		});

		// Add a 'close' event handler for the client socket
		client.on('close', function() {
    	console.log('Connection closed');
		});

	});
});
