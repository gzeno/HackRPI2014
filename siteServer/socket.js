// Javascript for io socket
var datastream = [];
var coords = [];
var mouseDown = false;
var lastx, lasty;
var context;
var scale = 1;
//final pix2cm = 0.026458333;
var cwidth;
var cheight;
var url = '129.161.52.43';
var socket = io.connect('http://localhost:8080');


socket.on("connection", function(){
	socket.emit('object',{data: "hello world"});
	socket.on("object",function(data){
		console.log(data);
	});
});

// Socket functions
socket.on('ready', function(data) {
	console.log("Server is ready. Sending data.");
	socket.emit('picData',{data: datastream});
});

socket.on('Error', function(data) {
	console.log("An error from the server occured: "+data);
});

$(document).ready(function() {
	$('#sendBut').on('click',sendToServer);
	init();
});

function sendToServer(e) {
	e.preventDefault();

	host = 10000;
	u = $('#ip').val();
	if (u != '') { url = u;}
	datastream[datastream.length] = $('#scale').val();
	datastream[datastream.length] = url;
	h = $('#host').val();
	if (h != '') { host = h;}
	datastream[datastream.length] = host;
	//console.log("Making sure server is ready");
	socket.emit('ready', {data: 'ready' });
	/*
	w = new WebSocket('ws://'+url);
	w.onopen = function(){
		w.send('I am ladygaga!');
	}
	w.onmessage = function(e){
		console.log(e.data.toString());
	}
	*/
}

function init(){
	context = document.getElementById('drawingCanvas').getContext("2d");

	$('#drawingCanvas').mousedown(function(e) {
		mouseDown = true;
		x = e.pageX - $(this).offset().left;
		y = e.pageY - $(this).offset().top;
		draw(x, y, false);
		datastream[datastream.length] = ""+x+" "+y;
		datastream[datastream.length] = 'd';
	});

	$('#drawingCanvas').mousemove(function (e) {
		if (mouseDown){
			//x,y = getMouse(e,$('drawingCanvas'));
			//draw(x,y,true);
			x = e.pageX - $(this).offset().left;
			y = e.pageY - $(this).offset().top;
			draw(x,y, true);
			datastream[datastream.length] = [x,y];
		}
	});

	$('#drawingCanvas').mouseup(function (e) {
		mouseDown = false;
		datastream[datastream.length] = 'u';
	});

	$('#drawingCanvas').mouseleave(function (e) {
		mouseDown = false;
		datastream[datastream.length] = 'u';
	});
	
}


function getMouse(a, canvas) {
	
	var e = canvas, offsetX = 0, offsetY = 0, mx=0, my=0;

	if (e.offsetParent !== undefined) {
		do{
			offsetX += e.offsetLeft;
			offsetY += e.offsetTop;
		} while ((e = e.offsetParent));
	}

	//offsetX += stylePaddingLeft + styleBorderLeft + htmlLeft;
	//offsetY += stylePaddingTop + styleBorderTop + htmlTop;

	mx = a.pageX - offsetX;
	my = a.pageY - offsetY;

	return {x: mx, y: my};
}

function draw(x, y, down) {
	if (down) {
		context.beginPath();
		context.strokeStyle = "black";
		context.lineJoin = "round";
		context.moveTo(lastx,lasty);
		context.lineTo(x,y);
		context.closePath();
		context.stroke();
	}
	lastx = x; 
	lasty = y;
}

function clear() {
	context.setTransform(1,0,0,1,0,0);
	context.clearRect(0,0,context.canvas.width, context.canvas.height);
}
