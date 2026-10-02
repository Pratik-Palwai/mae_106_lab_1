#include <Arduino.h>

const int LED_PIN = D3;
bool led_state = false;
unsigned long current_time = 0;

void setup() {
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  led_state = !led_state;

  digitalWrite(LED_PIN, led_state);
  delay(1000);
}