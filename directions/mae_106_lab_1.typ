#set document(
    title: [MAE106 Lab \#1 - Laboratory tools],
    author: "University of California, Irvine - Department of Mechanical and Aerospace Engineering",
)
#set page(paper: "us-letter", margin: 0.5in, fill: white)
#set text(size: 10pt, fill: black, lang: "en")
#set par(justify: false, leading: 0.72em, spacing: 1.05em)
#set list(marker: [-], spacing: 0.5em, body-indent: 0.4em)
#set enum(spacing: 0.5em, body-indent: 0.4em)
#show list: set block(above: 0.8em, below: 0.8em)
#show enum: set block(above: 0.8em, below: 0.8em)
#show raw.where(block: true): set text(size: 8.5pt)

// Real headings (tagged in the PDF and listed as bookmarks), styled like body text
#set heading(numbering: "1")
#show heading: it => block(above: 1.4em, below: 0.75em, sticky: true)[
    #set text(size: 10pt, weight: "regular")
    #box(width: 1.4em, align(right, counter(heading).display(it.numbering)))
    #h(0.4em)
    #it.body
]

// Layout helpers with consistent vertical spacing hierarchy
#let sec(title, body) = {
    heading(level: 1, title)
    pad(left: 1.8em, body)
}

#let sub(label, body) = {
    block(above: 0pt, below: 1.05em)[#body]
}

#let cont(body) = {
    block(above: 0pt, below: 1.05em)[#body]
}

#let fig(path, w, alt, caption) = {
    block(above: 0.4em, below: 1.05em, breakable: false, width: 100%)[
        #figure(
            image(path, width: w, alt: alt),
            caption: caption,
            gap: 0.25em,
        )
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

#sec[Goals][
    #sub[a][To learn how to use common laboratory tools that will be used throughout this course, including an oscilloscope, breadboard, potentiometer, multimeter, and the ESP32 microcontroller.]
]

#sec[Parts & equipment][
    #cont[
        #pad(left: -1.8em)[
            #align(center)[
                #table(
                    columns: (auto, auto),
                    stroke: 0.5pt,
                    inset: 4pt,
                    table.header([*Qty*], [*Part/Equipment*]),
                    [1], [Oscilloscope],
                    [1], [Breadboard],
                    [1], [Potentiometer],
                    [Various], [Wires],
                    [1], [Multimeter],
                    [1], [ESP32-C3 Super Mini],
                    [1], [USB Type-C to Type-A cable],
                    [1], [USB fuse],
                )
            ]
        ]
    ]
]

#sec[Introduction][
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

#sec[Safety First][
    #sub[a][Here are some safety rules to follow when working on your experiments:]
    #cont[
        - Double check circuits for proper connections and polarity prior to applying the power. For this lab, make sure you don't connect power or ground to the middle terminal of the potentiometer!
        - Set test instruments for proper function and range prior to taking a measurement.
        - Never touch circuits where electricity can go from one arm to the other, making a path through your heart.
        - Never place food or drinks near your electronics workspace.
    ]
]

#sec[Multimeters][
    #sub[a][A multimeter is an instrument designed to measure electric current, voltage (DC or AC), and resistance, typically over several ranges of values depending on the rotary switch position you choose. Throughout your labs, you will use a multimeter to measure DC voltages and resistances and to help you understand and debug your circuits.]
    #cont[To use your multimeter, connect your black probe to COM ("common ground") and your red probe to the V$Omega$mA plug. The other plug (labeled "10A max") is for the red probe when you want to measure current. To make a measurement, turn the dial to what you want to measure: resistance ($Omega$), DC voltage ($V "--"$), AC voltage ($V^~$), or current ($A "--"$). Turn to the setting that shows the max value that is just greater than what you expect to measure. For example, the ESP32's pins supply at most 5 Volts (3.3 Volts for the logic pins), so, to measure voltages from the ESP32, set it to 20 $V "--"$.]
    #fig(
        "figure_1.png",
        26%,
        "Handheld digital multimeter with a display, a rotary selector dial for resistance, DC voltage, AC voltage, and current ranges, and probe jacks labeled COM, V-ohm-mA, and 10A max.",
        [Multimeter],
    )
]

#sec[Oscilloscopes][
    #sub[a][An oscilloscope is a device for visually displaying voltage as a function of time. Many oscilloscopes have two channels, meaning they can read two different voltage waveforms. To measure a voltage, you connect the probe for a channel (say Channel 1) to the points on your circuit where you want to measure voltage. Remember the voltage is always measured across two points, so the probe has two connectors, one for the signal and one for the ground location on your circuit. Some probes have a sliding hood that you need to move back to expose the clip. Probes often also have a slider switch that allows you to amplify the signal by 10X; usually you will want to use the 1X setting.]
    #cont[To use your oscilloscope, the two main things you will want to consider are the voltage scaling and the timing scaling. Oscilloscopes have a faint grid overlaid on the screen like graph paper. Each little rectangle represents a certain amount of voltage and a certain amount of time. You can adjust these values using knobs on the oscilloscope. If you are too "zoomed in", you will see a noisy signal, and if you are too "zoomed out" you might not see changes in the signal. The Channel 1 voltage scale knob is usually under the Channel 1 label. The timing scale knob is usually to the right of that in its own spot and adjusts the timing for both channels. The oscilloscope will usually show you the grid scaling somewhere on the screen. Each channel also has an offset button you can use to change the vertical position of the voltage on the screen, but it's often good to set the offset so 0 volts shows in the middle of the screen.]
]

#sec[Breadboards][
    #sub[a][You will use an electronic breadboard (solderless breadboard) to wire up temporary circuits as you build different devices you design. Electronic components and wires are inserted into the numerous sockets (holes) on the board. The sockets (dots) are connected internally (lines) as shown in Figure 2. A good method for wiring complicated circuits is to connect the source voltage (+5V, +3.3V) and ground terminals to the long narrow horizontal strips (Figure 2). The components you place on the board now have ready access to power through short wires to sockets along the long strips. After wiring a circuit to the solderless board, the multimeter and oscilloscope are useful for measuring voltages at various points on the circuit, by using one of the multimeter probes.]
    #fig(
        "figure_2.png",
        58%,
        "Diagram of a solderless breadboard. Sockets are drawn as dots, and lines show which sockets are connected internally: short groups of sockets in the central area, and long horizontal strips along the edges used for the supply voltage and ground.",
        [Solderless Breadboard],
    )
]

#sec[Potentiometers][
    #sub[a][A potentiometer (also called a pot) is a device that you can use in your machine designs to measure a mechanical rotation because a pot outputs a voltage proportional to the rotation of its shaft. This is useful for different design activities, such as for sensing the angle of a robotic arm joint or a wheel attached to a motor shaft. You can also use a pot to set the voltage input into a circuit (for example, to allow you to adjust the loudness of a radio or the control gains for a robotic controller). Note that most potentiometers have a limited angular range of motion, meaning you cannot continuously turn the shaft.]
    #fig(
        "figure_3.png",
        50%,
        "Top: photo of a three-terminal potentiometer next to a diagram of its interior, where the wiper slides along a resistive strip, splitting it into R1 and R2. Bottom left, correct wiring: the outer terminals connect to Vin and ground, and the wiper (the arrow) gives Vout. Bottom right, incorrect wiring: the wiper is connected so that R2 can shrink to zero, shorting Vin.",
        [Potentiometer. Top: Actual potentiometer and internal diagram showing how the wiper slides along a resistive strip to change R1 and R2. Unless otherwise labeled, the wiper is the middle connector on the actual pot. Bottom: Circuit diagrams showing how to wire a pot properly (left) and improperly (right). The wiper is the wire with an arrow on it. The circuit on the right is a bad idea because R2 can go to zero as you move the wiper to its extreme on one end, creating a short circuit to power (Vin).],
    )
    #cont[Figure 3 (lower left) shows a pot being used that produces an output voltage proportional to the shaft rotation. The pot works as follows: as you turn the shaft of the pot, the wiper (which is wired to the middle terminal on the pot) moves along a resistive element. So, in the figure above, $R_1$ and $R_2$ change as the wiper slides along the resistance, while their sum, $R_1 + R_2 = "constant"$ (which is the "value" of the pot, so a 50K pot has $R_1 + R_2 = 50 "k"Omega$).]
    #cont[Derive $V_"out"$ as a function of $V_"in"$, $R_1$, and $R_2$ for Figure 3. Assume $R_2$ changes proportionally to the shaft angle of the pot. How then does the output voltage change as a function of the shaft angle of the pot. Using this information, brainstorm two possible uses for potentiometers on your final project.]
    #cont[_Answer:_ $V_"out" = R_2 / (R_1 + R_2) V_"in"$]
    #cont[Note: $V_"out"$ is linearly proportional to the angle of the potentiometer shaft!]
    #cont[Proof: If $R_2 = K theta$, where $K$ is constant and $theta$ is the angle of the pot, we set $V_"in" = "constant"$, and we know $R_1 + R_2 = R_"total" = "constant"$, then $V_"out" = (K theta / R_"total") times V_"in" = c theta$. That is, $V_"out"$ is proportional to the shaft angle, with some proportionality constant $c$.]
    #cont[To power the pot, plug the ESP32 into the computer through the USB fuse, then connect one outer terminal of the pot to the ESP32's 3.3V pin and the other outer terminal to GND (see Figure 4). Use 3.3V, not 5V, since you will later read the wiper voltage with the ESP32, whose input pins are only rated for 3.3V. The wiper (middle terminal) is $V_"out"$.]
    #cont[*Practical Exam 1:* Show your TA your derivation of $V_"out"$ as a function of $V_"in"$ and explain why $V_"out"$ changes as you turn the pot shaft. Then, use the multimeter to show that you can control the voltage output of the pot by turning the shaft. Finally, show the TA the voltage waveform using the oscilloscope as you turn the shaft.]
]

#sec[The ESP32 microcontroller and VScode/PlatformIO][
    #fig(
        "figure_4.png",
        52%,
        "Pinout diagram of the ESP32-C3 Super Mini board with its USB-C connector, labeling each pin's function, including the 5V, 3.3V, and GND power pins, the GPIO numbers (such as GPIO8 for the on-board LED), and the pins usable as analog-to-digital inputs.",
        [ESP32C3 Super Mini Pinout],
    )
    #sub[a][In this section of the lab, you will work with a microcontroller board that can be used to read many types of sensors as inputs and control a variety of actuators (e.g., dc motors, electronic valves). You will program your microcontroller using Microsoft Visual Studio Code IDE, which can compile C++ files using the PlatformIO extension.]

    #cont[You will use the ESP32 board to make an LED light blink. Note that these boards are equipped with an on-board LED (connected to the digital pin \#8) that we will use in this portion of the lab (this LED can be very useful to help you debug your programs).]
]

#sec[Example: Blink][
    #sub[a][Before starting, set up VScode, PlatformIO, and the ESP32 by following the instructions in the lab folder's "README.md". All the code for this lab is stored in "src/main.cpp". The `LAB_SECTION` constant at the top of the file chooses which part of the lab runs: set it to `1` for this section (blink the on-board LED, no serial output) and to `2` for Section 11 (blink the LED and print the elapsed time and LED state to the serial monitor).]

    #cont[Once the code is ready, compile the code either with Ctrl + Alt + B or by pressing the #sym.checkmark at the bottom left of the VScode window (it should be called PlatformIO: Build). Once PlatformIO finishes compiling the program, you can upload it with Ctrl + Alt + U or with the #sym.arrow.r button. Once it finishes uploading you should see the board's LED turn on and off.]

    #cont[IMPORTANT: Programs written with the Arduino framework (as used by PlatformIO here) must always include `#include <Arduino.h>` at the top of "main.cpp" and at least two functions: `setup()` and `loop()` (although they may also include more). As soon as the microcontroller is powered it will first run the commands in the `setup()` function and then move on to executing the commands in the `loop()` function until the power is removed.]
]

#sec[Serial Monitoring and Millis Function][
    #sub[a][You will often be interested in monitoring values in your program. To do this, you can use the Serial Monitor, a feature of PlatformIO that allows you to communicate with the board via serial commands (over USB). To explore this feature, set `LAB_SECTION` to `2` in "src/main.cpp". The code will then print the value being set to the LED pin (`led_state`) each time it toggles. Serial communication between the computer and the microcontroller is started in the `setup()` function with `Serial.begin(115200)`, and the values are printed in the `loop()` function with `Serial.print(...)` and `Serial.println(...)`.]
    #cont[Note: `Serial.print(...)` differs from `Serial.println(...)` in that 'println' includes a 'carriage return' at the end of the line, which ends printing on the line. In other words, the next print statement will start on a new line.]
    #cont[Each time it prints the state of the LED pin, the code also prints the time that has elapsed since the program began executing, using the `millis()` function. This is a brief introduction to using measurements of time in your programs.]
    #cont[Build and upload the code to the board as before. Finally, to monitor the values being printed to the serial port, open the PlatformIO Serial Monitor (the plug icon at the bottom of the VScode window). The baud rate of the monitor must match the value in `Serial.begin(...)`; this project's "platformio.ini" sets it to 115200. The Serial Monitor should update every second with the state of the LED pin. PlatformIO does not include a Serial Plotter, so show the output as a graph by copying the values into Excel or another graphing program.]
]

#sec[Read the Pot Voltage in the ESP32 and Display It][
    #sub[a][Using the lecture notes and online documentation on the Arduino-ESP32 web site, figure out how to read the pot voltage into the ESP32 using one of the Analog to Digital (A/D) pins (see Figure 4). Use the pot circuit from Section 8 and connect the wiper to the A/D pin. Then print the pot voltage to the serial monitor. Show also that you can graph the pot voltage as you turn the shaft.]
    #cont[This part is intentionally open-ended (rather than step-by-step instructions) so you learn how to use online resources to problem solve and build skills. You can do it if you endure the struggle to learn and stick with it! If you get stuck, consult the online Arduino-ESP32 and PlatformIO documentation, ask your lab mates for help, and ask your TA for help.]
]

#sec[Blink at 4 Hz Without `delay()`][
    #sub[a][Starting from the `LAB_SECTION = 2` code, make the LED blink at a frequency of 4 Hz, meaning four full on/off cycles per second (the LED turns on four times per second). The obvious way to do this is by modifying the `delay()` at the end of `loop()`. Note that the code toggles the LED once each time `loop()` runs, so each pass through `loop()` should take half of one period. Make sure to look at the light and count that the number of blinks in say 10 seconds is correct to confirm it's blinking at 4 Hz.]
    #cont[The problem with using the delay function is that it slows the program down so nothing is writing to the serial port while the delay is executing. You will see this when you plot your data; the serial port is only saving one point each time after the delay, so you will see something that looks more like a triangle wave. To improve this, after you have gotten it to blink at 4 Hz using `delay()`, remove the `delay()` and add some code that uses the information you get from `millis()` along with an if-then statement to make the LED blink at 4 Hz. Save the data with this version and plot it in Excel. You should see a square wave. For your final project, it's often better to avoid using `delay()` and to use the timer instead.]
    #cont[*Practical Exam \#2:* Show your TA both the `delay()` and `millis()` versions of the 4 Hz blink. Demonstrate that the light is blinking at 4 Hz by connecting the oscilloscope probe's signal clip to the LED pin (GPIO8) and its ground clip to a GND pin (see Figure 4), and displaying at least two periods of the signal. Also show your plot of the elapsed time and `led_state` data from the serial monitor.]
]
