#!/usr/bin/python

'''
api_server.py - This script creates a TCP server so the host Etch-A-Sketch
program can send the commands to draw.

Bryant Pong & Raymond Tse
Hack RPI 2014
11/15/14 

Last Updated: 11/16/14 - 11:03 AM   
'''

# Python Libaries:
import socket
import sys

import numpy as np
import math

# ROS Libraries:
from roomba_node.srv import *  
import rospy

# Global Variables:

# TCP Socket:
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind, Listen, Accept:
server_address = ('129.161.52.43', 9002)

# Inverse Kinematics Subproblem 0.
# Find the angle between two vectors.     
# 
#
#     (x2, y2)-------------------->(x3, y3)
#        |
#        |
#        |
#     (x1, y1)
#
# vec1X = x2 - x1
# vec2Y = y2 - y1
#
# vec2X = x3 - x2
# vec2Y = y3 - y2 
def subproblem0(vec1X, vec1Y, vec2X, vec2Y):

	# Create two numpy vectors from the parameters:
	x = np.array( ([vec1X, vec1Y]), dtype=float)
	y = np.array( ([vec2X, vec2Y]), dtype=float)

	theta = 2 * math.atan2(np.linalg.norm(x - y), np.linalg.norm(x + y))
	# theta = math.pi - theta
	theta *= 180 / math.pi 
	
	# Determine the sign of theta:
	if np.cross(x, y) < 0:
		theta *= -1.0

	return theta
		

def create_api_client(command, arg2):
	rospy.wait_for_service('create_message')
	try:
		create_api = rospy.ServiceProxy('create_message', CreateMessage)

		# Parse the command:
		if command == 'forward':
			respl = create_api('forward', float(arg2  * 0.4 ))
		elif command == 'turn':
			respl = create_api('turn', float(arg2 * 0.4))
		elif command == 'up':
			pass
		elif command == 'down':
			pass	 	  
		
		#respl = create_api('turn', -40, 0, 0, 0)
		return 1
	except rospy.ServiceException, e:
		print("Service call failed: %s " % e)

# The scaling factor   
# scalingFactor = 0

# Flag to check if we set the scaling factor
# setScalingFactor = False

def isfloat(value):
	try:
		float(value)
		return True
	except ValueError:
		return False

# Main server:
def main():
	print('Starting API Server on %s Port %s' % server_address)
	sock.bind(server_address)
	sock.listen(1)

	scalingFactor = 0

	timeToProcessString = False
	overallData = []

	previousX = 0.0
	previousY = 0.0

	previousVecX = 0.0
	previousVecY = -1.0

	while True:

		print('Waiting for a connection')
		connection, client_address = sock.accept()

		try:
			print('Image data from', client_address)

			while True:

				# Set the Scaling Factor if we haven't done so:
				
				data = connection.recv(9001)
				print('Received "%s"' % data)
					
				if data:

					print('Appending data to overallData')

					overallData += data

					#print('Now setting scaling factor to: ' + str(data[0]))
					#scalingFactor = int(data[0])

					#data = data[1:]
					#print('Remaining data is: %s' % data)
				
					#print('Sending data back to client')
					#connection.sendall(data)
					#create_api_client(0, 0)

					# Issue a call to the Create API:  

					# TO-DO: Extract the parameters from the image data sent:

					  
				else:
					print('No more data from', client_address)
					break

			print('Now processing commands: ' + str(overallData))
			niceData = ''.join(overallData)
			print('niceData = ' + str(niceData))

			# Split the data into a list without the spaces:
			niceDataList = niceData.split(' ')  
			print('niceDataList: ' + str(niceDataList))

			# Set the scaling factor:
			scalingFactor = int(niceDataList[0])
			print('scalingFactor is: ' + str(scalingFactor))

			# Get the remaining data:
			remainingData = niceDataList[1:]
			print('remainingData is ' + str(remainingData))

			skipNext = False

			# Now process the rest of the commands:
			for i in range(0, len(remainingData)):
				print('Debug only: nextCommand is: ' + str(remainingData[i]))	
		
				if isfloat(remainingData[i]) and skipNext == False:
					print('We got an X/Y Pair!')
					nextX = float(remainingData[i])
					nextY = float(remainingData[i+1])

					# We first need to spin the robot in place, then turn:	
					nextVecX = nextX - previousX
					nextVecY = nextY - previousY

					angleToTurn = subproblem0(previousVecX, previousVecY, nextVecX, nextVecY)
					create_api_client('turn', int(angleToTurn))

					# Now move that distance: 
					distanceToMove = math.sqrt( (nextX - previousX) ** 2 + (nextY - previousY) ** 2) 
					create_api_client('forward', int(distanceToMove * 10))
				
					print('The X/Y pair is: ' + str(nextX) + ',' + str(nextY))

					previousVecX = nextVecX
					previousVecY = nextVecY
					previousX = nextX
					previousY = nextY

					skipNext = True
				elif isfloat(remainingData[i]) and skipNext == True:
					skipNext = False
					continue

					 
			
		finally:
			connection.close()

if __name__ == '__main__':
	main()
