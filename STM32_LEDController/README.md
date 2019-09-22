# STM32 LED Panel Controller
This controller is centered around an STM32L031C6T which can control up to 8 panels using its GPIOB output register to set 16 data lines at once, currently the code only uses 4 of the panel outputs. The output is buffered through some 74LVC2G17GW Schmitt triggers which can output at 3.3V or 5V. The main board also includes space for an optional RFM69W 433MHz module.

The main board is powered by an ATX 24-pin connector, the STM32 chip is powered by the 5V standby line (dropped to 3.3V by an LDO) whist the output buffers are powered by either the 3.3V line or the main 5V line. The STM32 controls the PSU power pin and can turn the rest of the PSU on or off whilst being powered by the standby line.

The remaining GPIO pins are broken out onto a pin header, along with GND, 3.3V (standby), and the reset pin. A HAT has been included that can provide up to 8 button inputs, assuming the 433MHz module is not present. The buttons should just connect the signal line directly to ground when pressed.

The code was compiled using STM32CubeIDE and can be uploaded by using a cheap ST-Link V2 programmer from ebay.