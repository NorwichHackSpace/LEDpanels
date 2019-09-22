EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6600 2700 1    50   ~ 0
GND
Text Label 6700 2700 1    50   ~ 0
RST
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J3
U 1 1 5D86EC72
P 6900 2900
F 0 "J3" V 6904 3280 50  0000 L CNN
F 1 "Header" V 6995 3280 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x07_Pitch2.54mm" H 6900 2900 50  0001 C CNN
F 3 "~" H 6900 2900 50  0001 C CNN
	1    6900 2900
	0    1    1    0   
$EndComp
Text Label 6800 2700 1    50   ~ 0
A6
Text Label 6900 2700 1    50   ~ 0
A3
Text Label 7000 2700 1    50   ~ 0
A0
Text Label 7100 2700 1    50   ~ 0
C14
Text Label 7200 2700 1    50   ~ 0
3V3
Text Label 7200 3200 3    50   ~ 0
A10
Text Label 7100 3200 3    50   ~ 0
A9
Text Label 7000 3200 3    50   ~ 0
C15
Text Label 6900 3200 3    50   ~ 0
A2
Text Label 6800 3200 3    50   ~ 0
A5
Text Label 6700 3200 3    50   ~ 0
A7
Text Label 6600 3200 3    50   ~ 0
GND
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5D870D75
P 5500 4650
F 0 "J1" V 5346 4798 50  0000 L CNN
F 1 "Controller1" V 5600 4450 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch1.27mm" H 5500 4650 50  0001 C CNN
F 3 "~" H 5500 4650 50  0001 C CNN
	1    5500 4650
	0    1    1    0   
$EndComp
Text Label 5500 4450 1    50   ~ 0
GND
Text Label 5100 3950 0    50   ~ 0
A7
Text Label 5900 3950 2    50   ~ 0
A6
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5D872A11
P 6600 4650
F 0 "J2" V 6446 4798 50  0000 L CNN
F 1 "Controller2" V 6700 4450 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch1.27mm" H 6600 4650 50  0001 C CNN
F 3 "~" H 6600 4650 50  0001 C CNN
	1    6600 4650
	0    1    1    0   
$EndComp
Text Label 7000 3950 2    50   ~ 0
A3
Text Label 6200 3950 0    50   ~ 0
A5
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5D87350A
P 7800 4650
F 0 "J4" V 7646 4798 50  0000 L CNN
F 1 "Controller3" V 7900 4450 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch1.27mm" H 7800 4650 50  0001 C CNN
F 3 "~" H 7800 4650 50  0001 C CNN
	1    7800 4650
	0    1    1    0   
$EndComp
Text Label 7400 3950 0    50   ~ 0
A2
Text Label 8200 3950 2    50   ~ 0
C15
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 5D873A43
P 9000 4650
F 0 "J5" V 8846 4798 50  0000 L CNN
F 1 "Controller4" V 9100 4450 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch1.27mm" H 9000 4650 50  0001 C CNN
F 3 "~" H 9000 4650 50  0001 C CNN
	1    9000 4650
	0    1    1    0   
$EndComp
Text Label 8600 3950 0    50   ~ 0
C14
Text Label 9400 3950 2    50   ~ 0
A9
$Comp
L Switch:SW_Push SW1
U 1 1 5D8766F2
P 6650 2300
F 0 "SW1" H 6650 2585 50  0000 C CNN
F 1 "Reset" H 6650 2494 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 6650 2500 50  0001 C CNN
F 3 "~" H 6650 2500 50  0001 C CNN
	1    6650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2700 6600 2500
Wire Wire Line
	6600 2500 6450 2500
Wire Wire Line
	6450 2500 6450 2300
Wire Wire Line
	6850 2300 6850 2500
Wire Wire Line
	6850 2500 6700 2500
Wire Wire Line
	6700 2500 6700 2700
$Comp
L Device:R_POT RV1
U 1 1 5D878130
P 7000 1800
F 0 "RV1" V 6793 1800 50  0000 C CNN
F 1 "POT" V 6884 1800 50  0000 C CNN
F 2 "UserLibrary:Potentiometer_RV09_Vertical" H 7000 1800 50  0001 C CNN
F 3 "~" H 7000 1800 50  0001 C CNN
	1    7000 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2700 7000 2400
Wire Wire Line
	7150 1800 7200 1800
Wire Wire Line
	6850 1800 6450 1800
Wire Wire Line
	6450 1800 6450 2300
Connection ~ 6450 2300
$Comp
L Device:C_Small C5
U 1 1 5D87A27E
P 7100 2400
F 0 "C5" V 7050 2600 50  0000 C CNN
F 1 "100nF" V 7150 2650 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7100 2400 50  0001 C CNN
F 3 "~" H 7100 2400 50  0001 C CNN
	1    7100 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D87BFA0
P 5250 4200
F 0 "R1" H 5400 4150 50  0000 R CNN
F 1 "1K" H 5400 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5250 4200 50  0001 C CNN
F 3 "~" H 5250 4200 50  0001 C CNN
	1    5250 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5D87D0C1
P 5350 3950
F 0 "C1" V 5150 3950 50  0000 C CNN
F 1 "1uF" V 5250 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5350 3950 50  0001 C CNN
F 3 "~" H 5350 3950 50  0001 C CNN
	1    5350 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 4450 5500 3950
Wire Wire Line
	5400 4450 5400 4400
$Comp
L Device:R_Small R2
U 1 1 5D87EE5A
P 5750 4200
F 0 "R2" H 5900 4150 50  0000 R CNN
F 1 "1K" H 5900 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5750 4200 50  0001 C CNN
F 3 "~" H 5750 4200 50  0001 C CNN
	1    5750 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D87F563
P 5650 3950
F 0 "C2" V 5450 3950 50  0000 C CNN
F 1 "1uF" V 5550 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5650 3950 50  0001 C CNN
F 3 "~" H 5650 3950 50  0001 C CNN
	1    5650 3950
	0    1    1    0   
$EndComp
Connection ~ 5500 3950
Wire Wire Line
	5550 3950 5500 3950
Wire Wire Line
	5500 3950 5450 3950
Wire Wire Line
	5250 4400 5250 4300
Wire Wire Line
	5250 4400 5400 4400
Wire Wire Line
	5250 4100 5250 3950
Wire Wire Line
	5600 4450 5600 4400
Wire Wire Line
	5600 4400 5750 4400
Wire Wire Line
	5750 4400 5750 4300
Wire Wire Line
	5750 4100 5750 3950
Connection ~ 5750 3950
Wire Wire Line
	5750 3950 5900 3950
Wire Wire Line
	5250 3950 5100 3950
Connection ~ 5250 3950
Text Label 6600 4450 1    50   ~ 0
GND
$Comp
L Device:R_Small R3
U 1 1 5D88BE51
P 6350 4200
F 0 "R3" H 6500 4150 50  0000 R CNN
F 1 "1K" H 6500 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6350 4200 50  0001 C CNN
F 3 "~" H 6350 4200 50  0001 C CNN
	1    6350 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5D88BE5B
P 6450 3950
F 0 "C3" V 6250 3950 50  0000 C CNN
F 1 "1uF" V 6350 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6450 3950 50  0001 C CNN
F 3 "~" H 6450 3950 50  0001 C CNN
	1    6450 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 4450 6600 3950
$Comp
L Device:R_Small R4
U 1 1 5D88BE66
P 6850 4200
F 0 "R4" H 7000 4150 50  0000 R CNN
F 1 "1K" H 7000 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6850 4200 50  0001 C CNN
F 3 "~" H 6850 4200 50  0001 C CNN
	1    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5D88BE70
P 6750 3950
F 0 "C4" V 6550 3950 50  0000 C CNN
F 1 "1uF" V 6650 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6750 3950 50  0001 C CNN
F 3 "~" H 6750 3950 50  0001 C CNN
	1    6750 3950
	0    1    1    0   
$EndComp
Connection ~ 6600 3950
Wire Wire Line
	6650 3950 6600 3950
Wire Wire Line
	6600 3950 6550 3950
Wire Wire Line
	6350 4400 6350 4300
Wire Wire Line
	6350 4100 6350 3950
Wire Wire Line
	6850 4400 6850 4300
Wire Wire Line
	6850 4100 6850 3950
Connection ~ 6850 3950
Wire Wire Line
	6850 3950 7000 3950
Wire Wire Line
	6350 3950 6200 3950
Connection ~ 6350 3950
Wire Wire Line
	6350 4400 6500 4400
Wire Wire Line
	6500 4400 6500 4450
Wire Wire Line
	6850 4400 6700 4400
Wire Wire Line
	6700 4400 6700 4450
Text Label 7800 4450 1    50   ~ 0
GND
$Comp
L Device:R_Small R5
U 1 1 5D890E72
P 7550 4200
F 0 "R5" H 7700 4150 50  0000 R CNN
F 1 "1K" H 7700 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7550 4200 50  0001 C CNN
F 3 "~" H 7550 4200 50  0001 C CNN
	1    7550 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5D890E7C
P 7650 3950
F 0 "C6" V 7450 3950 50  0000 C CNN
F 1 "1uF" V 7550 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7650 3950 50  0001 C CNN
F 3 "~" H 7650 3950 50  0001 C CNN
	1    7650 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 4450 7800 3950
$Comp
L Device:R_Small R6
U 1 1 5D890E87
P 8050 4200
F 0 "R6" H 8200 4150 50  0000 R CNN
F 1 "1K" H 8200 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 8050 4200 50  0001 C CNN
F 3 "~" H 8050 4200 50  0001 C CNN
	1    8050 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5D890E91
P 7950 3950
F 0 "C7" V 7750 3950 50  0000 C CNN
F 1 "1uF" V 7850 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7950 3950 50  0001 C CNN
F 3 "~" H 7950 3950 50  0001 C CNN
	1    7950 3950
	0    1    1    0   
$EndComp
Connection ~ 7800 3950
Wire Wire Line
	7850 3950 7800 3950
Wire Wire Line
	7800 3950 7750 3950
Wire Wire Line
	7550 4400 7550 4300
Wire Wire Line
	7550 4100 7550 3950
Wire Wire Line
	8050 4400 8050 4300
Wire Wire Line
	8050 4100 8050 3950
Connection ~ 8050 3950
Wire Wire Line
	8050 3950 8200 3950
Wire Wire Line
	7550 3950 7400 3950
Connection ~ 7550 3950
Wire Wire Line
	7550 4400 7700 4400
Wire Wire Line
	7700 4400 7700 4450
Wire Wire Line
	8050 4400 7900 4400
Wire Wire Line
	7900 4400 7900 4450
Text Label 9000 4450 1    50   ~ 0
GND
$Comp
L Device:R_Small R7
U 1 1 5D8930EC
P 8750 4200
F 0 "R7" H 8900 4150 50  0000 R CNN
F 1 "1K" H 8900 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 8750 4200 50  0001 C CNN
F 3 "~" H 8750 4200 50  0001 C CNN
	1    8750 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5D8930F6
P 8850 3950
F 0 "C8" V 8650 3950 50  0000 C CNN
F 1 "1uF" V 8750 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 8850 3950 50  0001 C CNN
F 3 "~" H 8850 3950 50  0001 C CNN
	1    8850 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 4450 9000 3950
$Comp
L Device:R_Small R8
U 1 1 5D893101
P 9250 4200
F 0 "R8" H 9400 4150 50  0000 R CNN
F 1 "1K" H 9400 4250 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9250 4200 50  0001 C CNN
F 3 "~" H 9250 4200 50  0001 C CNN
	1    9250 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5D89310B
P 9150 3950
F 0 "C9" V 8950 3950 50  0000 C CNN
F 1 "1uF" V 9050 3950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9150 3950 50  0001 C CNN
F 3 "~" H 9150 3950 50  0001 C CNN
	1    9150 3950
	0    1    1    0   
$EndComp
Connection ~ 9000 3950
Wire Wire Line
	9050 3950 9000 3950
Wire Wire Line
	9000 3950 8950 3950
Wire Wire Line
	8750 4400 8750 4300
Wire Wire Line
	8750 4100 8750 3950
Wire Wire Line
	9250 4400 9250 4300
Wire Wire Line
	9250 4100 9250 3950
Connection ~ 9250 3950
Wire Wire Line
	9250 3950 9400 3950
Wire Wire Line
	8750 3950 8600 3950
Connection ~ 8750 3950
Wire Wire Line
	8750 4400 8900 4400
Wire Wire Line
	8900 4400 8900 4450
Wire Wire Line
	9250 4400 9100 4400
Wire Wire Line
	9100 4400 9100 4450
$Comp
L Device:R_Small R9
U 1 1 5D8A0057
P 7000 2150
F 0 "R9" H 7150 2100 50  0000 R CNN
F 1 "1K" H 7150 2200 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7000 2150 50  0001 C CNN
F 3 "~" H 7000 2150 50  0001 C CNN
	1    7000 2150
	1    0    0    -1  
$EndComp
Connection ~ 7200 2400
Wire Wire Line
	7200 2400 7200 2700
Wire Wire Line
	7200 1800 7200 2400
Wire Wire Line
	7000 1950 7000 2050
Wire Wire Line
	7000 2250 7000 2400
Connection ~ 7000 2400
$EndSCHEMATC
