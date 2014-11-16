#!/usr/bin/python

'''
api_server.py - This script creates a TCP server so the host Etch-A-Sketch
program can send the commands to draw.

Bryant Pong & Raymond Tse
Hack RPI 2014
11/15/14 

Last Updated: 11/15/14 - 10:10 PM   
'''

# Python Libaries:
import socket
import sys

import numpy as np

# ROS Libraries:
from roomba_node.srv import *  
import rospy

# Global Variables:

# TCP Socket:
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind, Listen, Accept:
server_address = ('129.161.52.43', 9001)

# Inverse Kinematics Subproblem 0.
# Find the angle between two vectors.     
def subproblem0(vec1X, vec1Y, vec2X, vec2Y):

	# Create two numpy 
	pass	

def create_api_client(arg1, arg2, arg3, arg4, arg5):
	rospy.wait_for_service('create_message')
	try:
		create_api = rospy.ServiceProxy('create_message', CreateMessage)
		respl = create_api('turn', -40, 0, 0, 0)
		return 1
	except rospy.ServiceException, e:
		print("Service call failed: %s " % e)

# Main server:
def main():
	print('Starting API Server on %s Port %s' % server_address)
	sock.bind(server_address)
	sock.listen(1)

	while True:

		print('Waiting for a connection')
		connection, client_address = sock.accept()

		try:
			print('Image data from', client_address)

			while True:
				data = connection.recv(16)
				print('Received "%s"' % data)
					
				if data:
					print('Sending data back to client')
					connection.sendall(data)
					create_api_client(0, 0, 0, 0, 0)

					# Issue a call to the Create API:  

					# TO-DO: Extract the parameters from the image data sent:

					  
				else:
					print('No more data from', client_address)
					break
		finally:
			connection.close()

if __name__ == '__main__':
	main()
