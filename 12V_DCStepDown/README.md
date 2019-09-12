# DCStepDown
This PCB takes 12V and steps it down to 4V (adjustable by modifying R13). Below 4V starts to change the white balance towards the blue end of the spectrum and below 3V the panels stop updating properly. Above 4V doesn't seem to change anything except use more power.

The board is built around the FAN2365 synchronous DC/DC converter which can supply up to 15A at up to 5V. With all LEDs on at 4V the board draws about 4.2A from the 12V input.

The LED data has to be clocked in as per the LED panel spec, but is passed through some 74LVC2G17 Schmitt triggers, so the data can be sent at 3.3V or 5V. The sending device must share a common ground with the board. The termination resistors can be modified based on the sender drive power and signal speed but has successfully been tested with a 60ns pulse width with 470ohm termination.

At full power the board struggles to move the heat away from the switching converter and inductor, so a 2-3mm thick piece of aluminium is recommended to be placed in the area marked "Heatsink" on the back of the board if continuous full power running is expected.
