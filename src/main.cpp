#include <Arduino.h>

// the setup loop runs once, when the board is powered on or when the reset button is clicked
void setup() {
  Serial.begin(115200); // begin the serial (USB) communication at 115200 baudrate. ensure the baudrate in your serial monitor matches
}

// the main loop runs over and over again as long as the board is powered
void loop() {
  Serial.println("Hello world");
  delay(500);
}