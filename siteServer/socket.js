// Javascript for io socket
var datastream = [];
var mouseDown = false;
var lastx, lasty;
var context;
var scale = 1;
var metric = 0;
//final pix2cm = 0.026458333;

var url = '129.161.52.43';
var socket = io.connect('http://localhost:8080');


// Socket functions
socket.on('ready', function(data) {
	console.log("Server is ready. Sending data.");
	socket.emit('picData',{data: datastream});
});

socket.on('Error', function(data) {
	console.log("An error from the server occured: "+data);
});

$(document).ready(function() {
	$('#ch').val(400);
	$('#cw').val(600);
	/*
	$('#metric').on('change',function(){
		metric = (metric + 1) % 2;
		if (metric == 1)
		
	});*/
	$('#sendBut').on('click',sendToServer);
	$('#clear').on('click',clear);
	$('#ch').on('change',function() {
		if (metric == 0) {
			$('#drawingCanvas').css("width",$('#ch').val());
		}
		/*else {
			$('#drawingCanvas').css("width",$('#ch').val()/0.02645833);
		}*/
	});
	$('#cw').on('change',function() {
		$('#drawingCanvas').css("height",$('#cw').val());
	});
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
	socket.emit('ready', {data: 'ready' });
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
	datastream = [];
}
