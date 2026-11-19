# MAE106 Lab 1 - Laboratory tools

Code for Lab 1, written for the ESP32-C3 Super Mini. Lab directions are in `directions/mae_106_lab_1.pdf`.

## Setup

1. Install Visual Studio Code and the PlatformIO IDE extension (VScode will suggest it when you open this folder).
2. Clone or download this repo and open the `mae_106_lab_1/` folder in VScode.
3. Connect the ESP32-C3 Super Mini to the computer with a USB data cable. The board, framework, and serial settings are already configured in `platformio.ini`, and PlatformIO auto-detects the COM port. If an upload fails, hold the BOOT button while plugging in the board.

## Code

All code for this lab is in `src/main.cpp`. Set `LAB_SECTION` at the top of the file to choose which part runs:

- `1`: blink the on-board LED (no serial output)
- `2`: blink the LED and print the elapsed time (`millis()`) and LED state to the serial monitor

## Build, upload, and monitor

- Build: Ctrl + Alt + B (or the checkmark at the bottom of the VScode window)
- Upload: Ctrl + Alt + U (or the arrow button)
- Serial monitor: Ctrl + Alt + S (or the plug icon). The baud rate is 115200, set by `monitor_speed` in `platformio.ini` and `Serial.begin(115200)` in the code.

PlatformIO has no built-in serial plotter. To graph serial data, either install a Serial Plotter extension (see below) or copy the values from the serial monitor into Excel or another graphing program.

## Serial Monitor and Serial Plotter extensions

Separate Serial Monitor and Serial Plotter extensions can be installed in VScode the same way PlatformIO was: open the Extensions view (Ctrl + Shift + X), search for "Serial Monitor" or "Serial Plotter", and click Install.

To open the Serial Monitor, click its tab in the bottom panel (next to Terminal), choose the board's COM port and a baud rate of 115200, then click Start Monitoring. To open the Serial Plotter, press Ctrl + Shift + P to open the Command Palette and search for "Serial Plotter: Open pane", then select the same port and baud rate. Only one program can use the COM port at a time, so stop the monitor/plotter before uploading new code.
