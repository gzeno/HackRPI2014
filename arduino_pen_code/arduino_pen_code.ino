/*
 * arduino_pen_code - This code runs on the Arduino waiting for 
 * the Roomba computer to send pen up and pen down commands.
 *
 * Bryant Pong & Raymond Tse
 * Hack RPI 2014
 * 11/16/14
 *
 * Last Updated: 11/16/14 - 12:08 AM
 */
#include <Servo.h>

Servo pen;

// Value of the next command:
int incoming = 0;

void penup() {
  pen.write(
} // End function penup()

void pendown() {
  
} // End function pendown()

void setup() {
 Serial.begin(9600); 
 
 pen.attach(9);
 
 Serial.println("Setup Complete!");
}

void loop() {
  if(Serial.available() > 0) {
    incoming = Serial.read(1);
  }
}
