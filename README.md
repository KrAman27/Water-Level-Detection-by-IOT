# Water-Level-Detection-by-IOT

#Introduction
To monitor liquid levels in a closed container (like a water tank) and report to the user if the liquid level crosses certain min or max thresholds.


#Abstract
We aim to make a IOT based liquid monitoring system, which uses a depth detection sensor to measure the level of a liquid in a closed container and inform the user when the liquid depth goes below or exceeds certain thresholds which vary from application to application. This notification goes to the user via a mobile application, which communicates with the microcontroller using a network interface like Wifi or Bluetooth. 


#Components
The hardware and software requirements are:-
Depth detection module: These are sensors that measure the levels of liquids in a container. They can have analog outputs with the sensor having a range of depths it can detect or it can have a point level output which will indicate whether or not the substance is above or below a certain sensing point 

Node MCU(ESP8266): Any MCU would suffice, we have used Node MCU(Arduino or Raspberry Pi would have worked as well). An MCU acts as the brain of an IOT application, it takes the signals from the input devices and converts them into command signals which it sends to the actuator, which produces the output.

Relay: Relay is an electrically operated switch which is used when it is necessary to control the circuit by an independent low powered signal or it is necessary to control multiple circuits by one signal
Breadboard: It is the platform on which all the other hardware components get connected 

Jumper cables: Will be used to connect the components

Flutter(Dart programming language): Flutter is an open-source UI development kit based on Dart programming language. It will be used to build a mobile interface which will interact with the hardware components of our project.


* Presentation : 
* Video Demonstration : 
