#!/usr/bin/python

'''
api_server.py - This script creates a TCP server so the host Etch-A-Sketch
program can send the commands to draw.

Bryant Pong & Raymond Tse
Hack RPI 2014
11/15/14 

Last Updated: 11/15/14 - 6:37 PM   
'''

# Python Libaries:
import socket
import sys

# Global Variables:

# TCP Socket:
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind, Listen, Accept:
server_address = ('129.161.52.43', 9001)
print('Starting API Server on %s Port %s' % server_address)
sock.bind(server_address)
sock.listen(1)

while True:

	print('Waiting for a connection')
	connection, client_address = sock.accept()

	try:
		print('Connection from', client_address)

		while True:
			data = connection.recv(16)
			print('Received "%s"' % data)
			if data:
				print('Sending data back to client')
				connection.sendall(data)
			else:
				print('No more data from', client_address)
				break
	finally:
		connection.close()
