#include <Arduino.h>

// set this to 1 to run the code for lab 3 part 1. set this to 2 to run the code for part 2
const int LAB_SECTION = 1;

const int LED_PIN = 3;
bool led_state = false;
unsigned long current_time = 0;

// the setup loop runs once, when the board is powered on or when the reset button is clicked
void setup() {
	pinMode(LED_PIN, OUTPUT); // initialize the correct pin as an output (versus an input pin)
  	Serial.begin(115200); // begin the serial (USB) communication at 115200 baudrate. ensure the baudrate in your serial monitor matches
	delay(500); // a short delay helps the serial communication get ready and stable before using it in the program
}

// the main loop runs over and over again as long as the board is powered
void loop() {
	led_state = !led_state; // alternates the led_state variable each time the command runs
	digitalWrite(LED_PIN, led_state); // if led_state is true, the pin goes to HIGH. if led_state is false, the pin goes to LOW

	if (LAB_SECTION == 1) {
		// for this lab it doesn't print anything in part 1, only blinks the LED, so this if statement is empty
	}

	else if (LAB_SECTION == 2) {
		current_time = millis(); // get the # of milliseconds since the board was turned on
		Serial.println(current_time + "    " + led_state);
	}

	delay(1000); // wait one second
}