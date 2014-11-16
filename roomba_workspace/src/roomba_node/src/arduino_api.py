#!/usr/bin/python

'''
arduino_api.py - This file provides a serial node that allows the Arduino to raise
and lower the pen.     

Bryant Pong & Raymond Tse
Hack RPI 2014
11/16/14

Last Updated: 11/16/14 - 12:50 AM
'''

# Python Libraries:
import serial

# ROS Libraries:
from roomba_node.srv import *
import rospy

# Global Variables:

# Serial Port for the Arduino:
arduinoSer = serial.Serial('/dev/ttyACM0', 9600)

# Handler for an Arduino Message:  
def arduino_handler(req):
	print("Now commanding the Pen to Position: " % req.command)
	arduinoSer.write(req.command)
	return 0

def main():
	rospy.init_node('arduino_server')
	ard = rospy.Service('arduino_service', ArduinoMessage, arduino_handler)
	print("Arduino Ready to Receive Commands!")
	rospy.spin()

if __name__ == '__main__':
	main()

