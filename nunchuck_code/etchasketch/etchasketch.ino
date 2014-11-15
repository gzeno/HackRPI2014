/*
 * etchasketch.ino - Arduino Sketch to allow Wii Nunchucks 
 * to simulate the knobs on the Etch a Sketch Webapp.
 *
 * Bryant Pong & Raymond Tse
 * Hack RPI 2014
 * 11/15/14 
 *
 * Last Updated: 11/15/14 - 4:38 PM
 */
#include <Wire.h>
#include "nunchuck_funcs.h"

/*** Global Variables ***/

// Loop variable to determine when to request for new nunchuck data:
int request_time = 0;

// These variables store the x and y locations of the nunchuck:
byte nunchuckX, nunchuckY;

/*** END SECTION GLOBAL VARIABLES ***/

void setup() {
  
  // We will be sending our commands at 9600 Baud
  Serial.begin(9600);
  
  // Initialize the Nunchucks:
  nunchuck_setpowerpins();
  nunchuck_init();
  
  // DEBUG ONLY - We completed setup successfully!
  Serial.println("Etch a Sketch Nunchucks Fully Initialized!");
}

void loop() {
  // Request data from the nunchuck every 100 milliseconds:
  if(request_time > 100) {
    
    request_time = 0;
    
    // Get the next set of data from the nunchuck:
    nunchuck_get_data();
    
    // Get the X and Y positions of the joystick:
    nunchuckX = nunchuck_joyx();
    nunchuckY = nunchuck_joyy();
    
    // DEBUG ONLY - Print out the X and Y values of the joystick:
    Serial.print("nunchuckX is: ");
    Serial.println((byte) nunchuckX, DEC);
    Serial.print("nunchuckY is: ");
    Serial.println((byte) nunchuckY, DEC);
    
  } // End if
  
  // Increment the request_time passed:
  request_time++;
  delay(1);
}
