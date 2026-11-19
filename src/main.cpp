#include <Arduino.h>

// set this to 1 to run the code for section 10 (Blink). set this to 2 to run the code for section 11 (Serial Monitoring and Millis Function)
const int LAB_SECTION = 1;

const int LED_PIN = 8;
bool led_state = false;
unsigned long current_time = 0;

// the setup loop runs once, when the board is powered on or when the reset button is clicked
void setup() {
	pinMode(LED_PIN, OUTPUT); // initialize the correct pin as an output (versus an input pin)
    Serial.begin(115200); // begin the serial (USB) communication at 115200 baudrate. ensure the baudrate in your serial monitor matches
	delay(1000); // give serial communication time to initialize
}

// the main loop runs over and over again as long as the board is powered
void loop() {
	led_state = !led_state; // alternates the led_state variable each time the command runs
	digitalWrite(LED_PIN, led_state); // if led_state is true, the pin goes to HIGH. if led_state is false, the pin goes to LOW

	if (LAB_SECTION == 1) {
		// Section 10: only blink the LED, no serial output needed
	}

	else if (LAB_SECTION == 2) {
		// Section 11: also print the elapsed time and LED state to the serial monitor
		current_time = millis(); // get the # of milliseconds since the board was turned on
		Serial.print(current_time);
		Serial.print("    ");
		Serial.println(led_state);
	}

	delay(1000); // wait one second
}
