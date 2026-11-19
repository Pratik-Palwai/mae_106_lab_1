#set page(paper: "us-letter", margin: 0.5in, fill: white)
#set text(size: 10pt, fill: black)
#set par(justify: false, leading: 0.72em, spacing: 1.05em)
#set list(marker: [-], spacing: 0.5em, body-indent: 0.4em)
#set enum(spacing: 0.5em, body-indent: 0.4em)
#show list: set block(above: 0.8em, below: 0.8em)
#show enum: set block(above: 0.8em, below: 0.8em)
#show raw.where(block: true): set text(size: 8.5pt)

// Layout helpers with consistent vertical spacing hierarchy
#let sec(num, title, body) = {
    block(above: 1.4em, below: 0.75em, sticky: true)[
        #box(width: 1.4em, align(right, num))
        #h(0.4em)
        #title
    ]
    pad(left: 1.8em, body)
}

#let sub(label, body) = {
    block(above: 0pt, below: 1.05em)[#body]
}

#let cont(body) = {
    block(above: 0pt, below: 1.05em)[#body]
}

#let fig(path, w, caption) = {
    block(above: 0.4em, below: 1.05em, breakable: false, width: 100%)[
        #align(center)[
            #image(path, width: w)
            #v(0.25em)
            #caption
        ]
    ]
}

// Centered Title Block
#align(center)[
    #text(size: 16pt)[MAE106 Lab \#1 - Laboratory tools]
    #v(0.35em)
    #text(size: 11pt)[
        University of California, Irvine \
        Department of Mechanical and Aerospace Engineering
    ]
]
#v(0.5em)

#sec[1][Goals][
    #sub[a][To learn how to use common laboratory tools that will be used throughout this course, including an oscilloscope, breadboard, potentiometer, multimeter, and the ESP32 microcontroller.]
]

#sec[2][Parts & equipment][
    #cont[
        #pad(left: -1.8em)[
            #align(center)[
                #table(
                    columns: (auto, auto),
                    stroke: 0.5pt,
                    inset: 4pt,
                    [*Qty*], [*Part/Equipment*],
                    [1], [Oscilloscope],
                    [1], [Breadboard],
                    [1], [Potentiometer],
                    [Various], [Wires],
                    [1], [Multimeter],
                    [1], [ESP32-C3 Super Mini],
                )
            ]
        ]
    ]
]

#sec[3][Introduction][
    #cont[
        - The oscilloscope is a useful tool for making measurements and debugging machines.
        - The solderless breadboard is useful for building circuits.
        - Potentiometers are common circuit elements to control voltages and measure rotations.
        - The multimeter is a tool for making electrical measurements and debugging machines.
        - The ESP32-C3 Super Mini is a very useful microcontroller that provides an easy setup to control electromechanical systems.
    ]
    #sub[b][Important Advice:]
    #cont[
        - When making electrical circuits, making a wiring mistake may result in a component getting "fried". Triple-check your wiring! If you smell something burning, immediately unplug the USB power cable and debug your circuit.
        - Whenever working on any circuit, disconnect power by unplugging the ESP32 board from your computer while working on the circuit.
        - The biggest risk is creating a short circuit across power (i.e., directly connecting 5V or 3.3V to GND somehow). Watch out for that mistake!
        - Be neat and tidy in your wiring! Develop a system for what different wires mean in your circuit. For example, always use red wires for 5V and black wires for GND.
    ]
]

#sec[4][Safety First][
    #sub[a][Here are some safety rules to follow when working on your experiments:]
    #cont[
        - Double check circuits for proper connections and polarity prior to applying the power. For this lab, make sure you don't connect power or ground to the middle terminal of the potentiometer!
        - Set test instruments for proper function and range prior to taking a measurement.
        - Never touch circuits where electricity can go from one arm to the other, making a path through your heart.
        - Disconnect power while working on your circuit.
        - Never place food or drinks near your electronics workspace.
    ]
]

#sec[5][Multimeters][
    #sub[a][A multimeter is an instrument designed to measure electric current, voltage (DC or AC), and resistance, typically over several ranges of values depending on the rotary switch position you choose. Throughout your labs, you will use a multimeter to measure DC voltages and resistances and to help you understand and debug your circuits.]
    #cont[To use your multimeter, connect your black probe to COM ("common ground") and your red probe to the V$Omega$mA plug. The other plug (labeled "10A max") is for the red probe when you want to measure current. To make a measurement, turn the dial to want to measure: resistance ($Omega$), DC voltage ($V "--"$), AC voltage ($V^~$), or current ($A "--"$). Turn to the setting that shows the max value that is just greater than what you expect to measure. For example, the ESP32's pins supply at most 5 Volts (3.3 Volts for the logic pins), so, to measure voltages from the ESP32, set it to 20 $V "--"$.]
    #fig("figure_1.png", 26%, [Figure 1: Multimeter])
]

#sec[6][Oscilloscopes][
    #sub[a][An oscilloscope is a device for visually displaying voltage as a function of time. Many oscilloscopes have two channels, meaning they can read two different voltage waveforms. To measure a voltage, you connect the probe for a channel (say Channel 1) to the points on your circuit where you want to measure voltage. Remember the voltage is always measured across two points, so the probe has two connectors, one for the signal and one for the ground location on your circuit. Some probes have a sliding hood that you need to move back to expose the clip. Probes often also have a slider switch that allows you to amplify the signal by 10X; usually you will want to use the 1X setting.]
    #cont[To use your oscilloscope, the two main things you will want to consider are the voltage scaling and the timing scaling. Oscilloscopes have a faint grid overlaid on the screen like graph paper. Each little rectangle represents a certain amount of voltage and a certain amount of time. You can adjust these values using knobs on the oscilloscope. If you are too "zoomed in", you will see a noisy signal, and if you are too "zoomed out" you might not see changes in the signal. The Channel 1 voltage scale knob is usually under the Channel 1 label. The timing scale knob is usually to the right of that in its own spot and adjusts the timing for both channels. The oscilloscope will usually show you the grid scaling somewhere on the screen. Each channel also has an offset button you can use to change the vertical position of the voltage on the screen, but it's often good to set the offset so 0 volts shows in the middle of the screen.]
]

#sec[7][Breadboards][
    #sub[a][You will use an electronic breadboard (solderless breadboard) to wire up temporary circuits as you build different devices you design. Electronic components and wires are inserted into the numerous sockets (holes) on the board. The sockets (dots) are connected internally (lines) as shown in Figure 2. A good method for wiring complicated circuits is to connect the source voltage (+5V, +3.3V) and ground terminals to the long narrow horizontal strips (Figure 2). The components you place on the board now have ready access to power through short wires to sockets along the long strips. After wiring a circuit to the solderless board, the multimeter and oscilloscope are useful for measuring voltages at various points on the circuit, by using one of the multimeter probes.]
    #fig("figure_2.png", 58%, [Figure 2: Solderless Breadboard])
]

#sec[8][Potentiometers][
    #sub[a][A potentiometer (also called a pot) is a device that you can use in your machine designs to measure a mechanical rotation because a pot outputs a voltage proportional to the rotation of its shaft. This is useful for different design activities, such as for sensing the angle of a robotic arm joint or a wheel attached to a motor shaft. You can also use a pot to set the voltage input into a circuit (for example, to allow you to adjust the loudness of a radio or the control gains for a robotic controller). Note that most potentiometers have a limited angular range of motion, meaning you cannot continuously turn the shaft.]
    #fig("figure_3.png", 50%, [Figure 3: Potentiometer. Top: Actual potentiometer and internal diagram showing how the wiper slides along a resistive strip to change R1 and R2. Unless otherwise labeled, the wiper is the middle connector on the actual pot. Bottom: Circuit diagrams showing how to wire a pot properly (left) and improperly (right). The wiper is the wire with an arrow on it. The circuit on the right is a bad idea because R2 can go to zero as you move the wiper to its extreme on one end, creating a short circuit to power (Vin).])
    #cont[Figure 3 (lower left) shows a pot being used that produces an output voltage proportional to the shaft rotation. The pot works as follows: as you turn the shaft of the pot, the wiper (which is wired to the middle terminal on the pot) moves along a resistive element. So, in the figure above, $R_1$ and $R_2$ change as the wiper slides along the resistance, while their sum, $R_1 + R_2 = "constant"$ (which is the "value" of the pot, so a 50K pot as $R_1 + R_2 = 50 "k"Omega$).]
    #cont[Derive $V_"out"$ as a function of $V_"in"$, $R_1$, and $R_2$ for Figure 3. Assume $R_2$ changes proportionally to the shaft angle of the pot. How then does the output voltage change as a function of the shaft angle of the pot. Using this information, brainstorm two possible uses for potentiometers on your final project.]
    #cont[_Answer:_ $V_"out" = R_2 / (R_1 + R_2) V_"in"$]
    #cont[Note: $V_"out"$ is linearly proportional to the angle of the potentiometer shaft!]
    #cont[Proof: If $R_2 = K theta$, where $K$ is constant and $theta$ is the angle of the pot, we set $V_"in" = "constant"$, and we know $R_1 + R_2 = R_"total" = "constant"$, then $V_"out" = (K theta / R_"total") times V_"in" = c theta$. That is, $V_"out"$ is proportional to the shaft angle, with some proportionality constant $c$.]
    #cont[*Practical Exam 1:* Show your TA your derivation of $V_"out"$ as a function of $V_"in"$ and explain why $V_"out"$ changes as you turn the pot shaft. Then, use the multimeter to show that you can control the voltage output of the pot by turning the shaft. Finally, show the TA the voltage waveform using the oscilloscope as you turn the shaft.]
]

#sec[9][The ESP32 microcontroller and VSCode/PlatformIO][
    #fig("figure_4.png", 52%, [Figure 4: ESP32C3 Super Mini Pinout])
    #sub[a][In this section of the lab, you will work with a microcontroller board that can be used to read many types of sensors as inputs and control a variety of actuators (e.g., dc motors, electronic valves). You will program your microcontroller using Microsoft Visual Studio Code IDE, which can compile C++ files using the PlatformIO extension.]

    #cont[You will use the ESP32 board to make an LED light blink. Note that these boards are equipped with an on-board LED (connected to the digital pin \#8) that we will use in this portion of the lab (this LED can be very useful to help you debug your programs).]
]

#sec[10][Software setup][
    #sub[a][First, install Visual Studio Code and the PlatformIO IDE extension (VScode will offer it as a recommended extension when you open the lab folder). Then connect the ESP32-C3 Super Mini to the computer with a USB cable. The board, framework, and serial settings are already configured in the project's "platformio.ini" file, so you do not need to select a board manually, and PlatformIO auto-detects the communication port (COM port on Windows machines). Plugging the USB cable in and out can solve some of the connection problems you may face. If PlatformIO cannot find the board, the cable (make sure it supports data, not just charging) or the ESP32 itself may be bad. If the upload fails, hold the BOOT button while plugging in the board to put it into upload mode.]
]

#sec[11][Example: Blink][
    #sub[a][Open the lab folder "mae_106_lab_1/" in VScode, and navigate to the source code folder "src/". All the code for this lab is stored in "main.cpp".]

    #cont[Once the code is ready, compile the code either with Ctrl + Alt + B or by pressing the #sym.checkmark at the bottom left of the VScode window (it should be called PlatformIO: Build). Once PlatformIO finishes compiling the program, you can upload it with Ctrl + Alt + U or with the #sym.arrow.r button. PlatformIO will auto-detect the ESP32's COM port, and once it finishes uploading you should see the board's LED turn on and off.]

    #cont[IMPORTANT: Programs written with the Arduino framework (as used by PlatformIO here) must always include `#include <Arduino.h>` at the top of "main.cpp" and at least two functions: `setup()` and `loop()` (although they may also include more). As soon as the microcontroller is powered it will first run the commands in the `setup()` function and then move on to executing the commands in the `loop()` function until the power is removed.]
]

#sec[12][Serial Monitoring and Millis Function][
    #sub[a][You will often be interested in monitoring values in your program. To do this, you can use the Serial Monitor. The Serial Monitor is a feature of PlatformIO that allows you to communicate with the board via serial commands (over USB). To explore this feature, we will print to the serial port the value being set to the LED pin. First, we will modify the 'Blink' example to allow for serial communication between the computer and the microcontroller; we do this by adding the following command to the `setup()` function: `Serial.begin(115200)`. We can now "print" to the serial command the value being set to the LED pin using the `Serial.print(...)` or `Serial.println(...)` command in the `loop()` function.]
    #cont[Note: `Serial.print(...)` differs from `Serial.println(...)` in that 'println' includes a 'carriage return' at the end of the line, which ends printing on the line. In other words, the next print statement will start on a new line.]
    #cont[We will add a measure of the time that has elapsed since the program began executing. This will be a brief introduction into using measurements of time in your programs. To do this, we will use the `millis()` function and print the current time of the program each time we print the state of the LED pin.]
    #cont[Once the code is ready, build it and upload it to the board (Ctrl + Alt + B and Ctrl + Alt + U). Finally, to monitor the values being printed to the serial port, open the PlatformIO Serial Monitor (click Ctrl + Alt + S or the plug icon at the bottom of the VScode window). The baud rate of the monitor must match the value in `Serial.begin(...)`; this project's "platformio.ini" sets it to 115200. The Serial Monitor should update every second with the state of the LED pin. PlatformIO does not include a Serial Plotter, so show the output as a graph by copying the values into Excel or another graphing program.]
]

#sec[13][Read the Pot Voltage in the ESP32 and Display It][
    #sub[a][Using the lecture notes and online documentation on the Arduino-ESP32 web site, figure out how to read the pot voltage into the ESP32 using one of the Analog to Digital (A/D) pins (see Figure 4). Power the pot from the 3.3V pin, not 5V, since the ESP32's input pins are only rated for 3.3V. Then print the pot voltage to the serial monitor. Show also that you can graph the pot voltage as you turn the shaft. You can highlight and copy-paste the serial monitor values in Excel or another graphing program.]
    #cont[Now, modify the code provided in the 'Blink' example and make the LED blink at a frequency of 4Hz. The obvious way to do this is by modifying the delay. Make sure to look at the light and count that the number of blinks in say 10 seconds is correct to confirm it's blinking at 4 Hz.]
    #cont[The problem with using the delay function is that it slows the program down so nothing is writing to the serial port while the delay is executing. You will see this when you plot your data; the serial port is only saving one point each time after the delay, so you will see something that looks more like a triangle wave. The way to improve this is to eliminate the delays and use the timer and If-then statement to adjust the blink rate. After you have gotten it to blink at 4 Hz using the delay function, remove the delay functions and add some code that uses the information you get from `millis()` along with an if-then statement to make the timer blink at 4 Hz. Save the data with this version and plot it in Excel. You should see a square wave. For your final project, it's often better to avoid using `delay()` and to use the timer as, again, `delay()` shuts everything down for a while.]
    #cont[This part is intentionally open-ended (rather than step-by-step instructions) so you learn how to use online resources to problem solve and build skills. You can do it if you endure the struggle to learn and stick with it! If you get stuck, consult the online Arduino-ESP32 and PlatformIO documentation, ask your lab mates for help, and ask your TA for help.]
    #cont[*Practical Exam \#2:* Modify the code provided in the 'Blink' example and make the LED blink at a frequency of 4Hz. Do this first by modifying the `delay()` functions, then remove the `delay()` functions and come up with a way to do it by checking `millis()`. Show your TA that the light is blinking at 4 Hz by connecting the board to the oscilloscope and displaying at least two periods of the signal. You should also copy the elapsed time and `ledState` data that were printed to the serial monitor and plot it in, e.g., Excel.]
    #cont[Extra time, self-motivated, and curious? Try to figure out how to read the pot voltage into the ESP32 using one of the A/D pins, then use it to turn the LED on and off.]
]
