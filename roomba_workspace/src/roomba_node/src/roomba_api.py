#!/usr/bin/python

'''
roomba_api.py - This file provides an API for the iRobot Create Roomba.

Bryant Pong & Raymond Tse
Hack RPI 2014
11/15/14

Last Updated: 11/15/14 - 6:16 PM      
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
	print("Now executing an API request with parameters: %s %s %s %s %s]" % (req.command, req.argument1, req.argument2, req.argument3, req.argument4))
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
