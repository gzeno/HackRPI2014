#!/usr/bin/python

'''
roomba_api.py - This file provides an API for the iRobot Create Roomba.

Bryant Pong & Raymond Tse
Hack RPI 2014
11/15/14

Last Updated: 11/15/14 - 11:06 PM      
'''

# ROS Libraries:
from roomba_node.srv import *
import rospy

# Standard ROS Libraries:
import serial

# Global Variables:

# The serial port to talk to the Create:
serialPort = serial.Serial('/dev/ttyUSB0', 57600)

'''
This function takes an array of ints to write and sends them in the form of
a byte array:
'''
def sendBytes(bytesToWrite):
	convertedBytes = bytearray(bytesToWrite)
	serialPort.write(convertedBytes)	
  
# This is the API Handler for a Roomba Command:
def handle_api_request(req):
	print("Now executing an API request with parameters: %s %s]" % (req.command, req.argument1))

	# Process a forward command.  The forward command has 1 argument: The
	# distance to travel (in cm).
	if req.command == 'forward':
		# Convert the second argument into millimeters:
		distanceInMillis = req.argument1 * 10 				  

		# Convert the distance to travel to hexadecimal:
		high, low = divmod(int(distanceInMillis), 0x100)
	
		# Send out the drive forward command: 
		sendBytes([137, 1, 44, 128, 0])

		# Wait till the Create has reached the distanceInMillis:
		sendBytes([156, high, low])
		
		# Stop the robot:
		sendBytes([137, 0, 0, 0, 0])

	elif req.command == 'turn':
		
		# Get the amount of degrees to turn:
		degreesToTurn = req.argument1		 

		# If the angle is positive, rotate counterclockwise: 
		if degreesToTurn > 0:
			sendBytes([137, 1, 44, 0, 1])		
			high, low = divmod(int(degreesToTurn), 0x100)
			sendBytes([157, high, low])
			sendBytes([137, 0, 0, 0, 0])
		else:
			sendBytes([137, 1, 44, 0, 1])
			degreesToTurn += 360
			high, low = divmod(int(degreesToTurn), 0x100)
			sendBytes([157, high, low])
			sendBytes([137, 0, 0, 0, 0])

	return 4   

# Main function
def main():
	# We must send the OpCodes 128 and 132 to initialize the Create's API:
	# 128: Initialze Open Interface
	# 132: Specify Full Mode (have access to all sensors and actuators) 
	sendBytes([128, 132])

	# DEBUG ONLY - Send out the "Wimp" Demo (VALIDATED/WORKS)
	#sendBytes([136, 5]) 

	# Create the API Service Handler:
	rospy.init_node('create_api_server')
	
	# Initialize the ROS service to handle the next action to perform:
	apiService = rospy.Service('create_message', CreateMessage, handle_api_request)
	print("Ready to Process Create API Commands!")
	rospy.spin()  	  

# Main function called here:
if __name__ == '__main__':
	main()
