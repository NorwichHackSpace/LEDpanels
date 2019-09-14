EESchema Schematic File Version 4
LIBS:DCStepDown-cache
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
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J0
U 1 1 5D49E69A
P 7350 3400
F 0 "J0" H 7400 3717 50  0000 C CNN
F 1 "Conn_02x04" H 7400 3626 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 7350 3400 50  0001 C CNN
F 3 "~" H 7350 3400 50  0001 C CNN
	1    7350 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J1
U 1 1 5D49EF18
P 7350 4500
F 0 "J1" H 7400 4817 50  0000 C CNN
F 1 "Conn_02x04" H 7400 4726 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 7350 4500 50  0001 C CNN
F 3 "~" H 7350 4500 50  0001 C CNN
	1    7350 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J2
U 1 1 5D49F751
P 7350 5650
F 0 "J2" H 7400 5967 50  0000 C CNN
F 1 "Conn_02x04" H 7400 5876 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 7350 5650 50  0001 C CNN
F 3 "~" H 7350 5650 50  0001 C CNN
	1    7350 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3600 7150 3500
Connection ~ 7150 3400
Wire Wire Line
	7150 3400 7150 3300
Connection ~ 7150 3500
Wire Wire Line
	7150 3500 7150 3400
Wire Wire Line
	7650 3300 7650 3400
Connection ~ 7650 3400
Wire Wire Line
	7650 3400 7650 3500
Connection ~ 7650 3500
Wire Wire Line
	7650 3500 7650 3600
Wire Wire Line
	7650 3400 7950 3400
Text Label 7750 3400 0    50   ~ 0
VOUT
Text Label 6650 3400 0    50   ~ 0
VOUT
Wire Wire Line
	7650 5550 7650 5650
Connection ~ 7650 5650
Wire Wire Line
	7650 5650 7650 5750
Connection ~ 7650 5750
Wire Wire Line
	7650 5750 7650 5850
Wire Wire Line
	7150 5850 7150 5750
Connection ~ 7150 5650
Wire Wire Line
	7150 5650 7150 5550
Connection ~ 7150 5750
Wire Wire Line
	7150 5750 7150 5650
Wire Wire Line
	7650 5650 7800 5650
Wire Wire Line
	7150 5650 7000 5650
$Comp
L Converter_DCDC:FAN2365 U1
U 1 1 5D4D3F25
P 4450 3700
F 0 "U1" H 4400 4000 50  0000 C CNN
F 1 "FAN2365" V 4400 3550 50  0000 C CNN
F 2 "UserLibrary:DC_Buck_FAN2365" H 5300 4150 50  0001 C CNN
F 3 "" H 5300 4150 50  0001 C CNN
	1    4450 3700
	1    0    0    -1  
$EndComp
Text Label 1450 3050 2    50   ~ 0
VIN
Wire Wire Line
	3750 3050 3750 3150
Connection ~ 3750 3150
Wire Wire Line
	3750 3150 3750 3250
Connection ~ 3750 3250
Wire Wire Line
	3750 3250 3750 3350
Connection ~ 3750 3350
Wire Wire Line
	3750 3350 3750 3450
Connection ~ 3750 3450
Wire Wire Line
	3750 3450 3750 3550
Connection ~ 3750 3550
Wire Wire Line
	3750 3550 3750 3650
Connection ~ 3750 3650
Wire Wire Line
	3750 3650 3750 3750
Connection ~ 3750 3750
Wire Wire Line
	3750 3750 3750 3850
Connection ~ 3750 3050
Wire Wire Line
	5050 3400 5050 3500
Connection ~ 5050 3500
Wire Wire Line
	5050 3500 5050 3600
Connection ~ 5050 3600
Wire Wire Line
	5050 3600 5050 3700
Connection ~ 5050 3700
Wire Wire Line
	5050 3700 5050 3800
Connection ~ 5050 3800
Wire Wire Line
	5050 3800 5050 3900
Connection ~ 5050 3900
Wire Wire Line
	5050 3900 5050 4000
Connection ~ 5050 4000
Wire Wire Line
	5050 4000 5050 4100
Text Label 5300 3400 0    50   ~ 0
SW
Wire Wire Line
	4250 4750 4350 4750
Connection ~ 4350 4750
Wire Wire Line
	4350 4750 4450 4750
Connection ~ 4450 4750
Wire Wire Line
	4450 4750 4550 4750
$Comp
L power:GND #PWR0101
U 1 1 5D4D7A2A
P 4350 4850
F 0 "#PWR0101" H 4350 4600 50  0001 C CNN
F 1 "GND" H 4355 4677 50  0000 C CNN
F 2 "" H 4350 4850 50  0001 C CNN
F 3 "" H 4350 4850 50  0001 C CNN
	1    4350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4750 4350 4850
$Comp
L Device:R_Small R1
U 1 1 5D4DCD89
P 4400 2450
F 0 "R1" V 4204 2450 50  0000 C CNN
F 1 "10" V 4295 2450 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4400 2450 50  0001 C CNN
F 3 "~" H 4400 2450 50  0001 C CNN
	1    4400 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 2750 4500 2750
Wire Wire Line
	4500 2750 4500 2450
Wire Wire Line
	4350 2750 4300 2750
Wire Wire Line
	4300 2750 4300 2450
$Comp
L Device:C_Small C1
U 1 1 5D4DFD74
P 4700 2600
F 0 "C1" H 4792 2646 50  0000 L CNN
F 1 "22uF" H 4792 2555 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4700 2600 50  0001 C CNN
F 3 "~" H 4700 2600 50  0001 C CNN
	1    4700 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5D4E0416
P 4100 2600
F 0 "C2" H 3900 2650 50  0000 L CNN
F 1 "22uF" H 3850 2550 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4100 2600 50  0001 C CNN
F 3 "~" H 4100 2600 50  0001 C CNN
	1    4100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2450 4700 2450
Wire Wire Line
	4700 2450 4700 2500
Connection ~ 4500 2450
Wire Wire Line
	4300 2450 4100 2450
Wire Wire Line
	4100 2450 4100 2500
Connection ~ 4300 2450
$Comp
L power:GND #PWR0102
U 1 1 5D4E1A02
P 4100 2700
F 0 "#PWR0102" H 4100 2450 50  0001 C CNN
F 1 "GND" H 4105 2527 50  0000 C CNN
F 2 "" H 4100 2700 50  0001 C CNN
F 3 "" H 4100 2700 50  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D4E1B7F
P 4700 2700
F 0 "#PWR0103" H 4700 2450 50  0001 C CNN
F 1 "GND" H 4705 2527 50  0000 C CNN
F 2 "" H 4700 2700 50  0001 C CNN
F 3 "" H 4700 2700 50  0001 C CNN
	1    4700 2700
	1    0    0    -1  
$EndComp
NoConn ~ 5050 3150
$Comp
L Device:R_Small R2
U 1 1 5D4E8590
P 2750 4050
F 0 "R2" H 2809 4096 50  0000 L CNN
F 1 "3K" H 2809 4005 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2750 4050 50  0001 C CNN
F 3 "~" H 2750 4050 50  0001 C CNN
	1    2750 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D4E8A64
P 2750 4350
F 0 "R3" H 2809 4396 50  0000 L CNN
F 1 "1K" H 2809 4305 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2750 4350 50  0001 C CNN
F 3 "~" H 2750 4350 50  0001 C CNN
	1    2750 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5D4E8EF5
P 2750 4550
F 0 "#PWR0104" H 2750 4300 50  0001 C CNN
F 1 "GND" H 2755 4377 50  0000 C CNN
F 2 "" H 2750 4550 50  0001 C CNN
F 3 "" H 2750 4550 50  0001 C CNN
	1    2750 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4450 2750 4500
Wire Wire Line
	2750 4150 2750 4250
Wire Wire Line
	2750 4250 3750 4250
Connection ~ 2750 4250
$Comp
L Device:L L1
U 1 1 5D4ED186
P 6150 3400
F 0 "L1" V 6340 3400 50  0000 C CNN
F 1 "2.2uH" V 6249 3400 50  0000 C CNN
F 2 "UserLibrary:Inductor_SRP1250" H 6150 3400 50  0001 C CNN
F 3 "~" H 6150 3400 50  0001 C CNN
	1    6150 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5D4F99F0
P 5150 3050
F 0 "C3" V 4921 3050 50  0000 C CNN
F 1 "100nF" V 5012 3050 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5150 3050 50  0001 C CNN
F 3 "~" H 5150 3050 50  0001 C CNN
	1    5150 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5D4FB3E7
P 3500 3150
F 0 "C4" H 3450 3450 50  0000 L CNN
F 1 "10uF" H 3450 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 3500 3150 50  0001 C CNN
F 3 "~" H 3500 3150 50  0001 C CNN
	1    3500 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5D4FBC7B
P 3250 3150
F 0 "C5" H 3200 3450 50  0000 L CNN
F 1 "10uF" H 3200 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 3250 3150 50  0001 C CNN
F 3 "~" H 3250 3150 50  0001 C CNN
	1    3250 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5D4FC0B7
P 3000 3150
F 0 "C6" H 2950 3450 50  0000 L CNN
F 1 "10uF" H 2950 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 3000 3150 50  0001 C CNN
F 3 "~" H 3000 3150 50  0001 C CNN
	1    3000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3050 3250 3050
Connection ~ 3250 3050
Connection ~ 3500 3050
Wire Wire Line
	3500 3050 3750 3050
$Comp
L Device:C_Small C7
U 1 1 5D4FD68B
P 2750 3150
F 0 "C7" H 2700 3450 50  0000 L CNN
F 1 "10uF" H 2700 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 2750 3150 50  0001 C CNN
F 3 "~" H 2750 3150 50  0001 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3050 2900 3050
Connection ~ 3000 3050
$Comp
L power:GND #PWR0105
U 1 1 5D5009C3
P 1750 3250
F 0 "#PWR0105" H 1750 3000 50  0001 C CNN
F 1 "GND" H 1755 3077 50  0000 C CNN
F 2 "" H 1750 3250 50  0001 C CNN
F 3 "" H 1750 3250 50  0001 C CNN
	1    1750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3250 3250 3250
Connection ~ 3000 3250
Wire Wire Line
	3000 3250 2750 3250
Connection ~ 3250 3250
Wire Wire Line
	3250 3250 3000 3250
Text Label 1450 3250 2    50   ~ 0
GND
$Comp
L Device:CP_Small C8
U 1 1 5D503AC2
P 2000 3150
F 0 "C8" H 1950 3450 50  0000 L CNN
F 1 "330uF" H 1900 3350 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P3.50mm" H 2000 3150 50  0001 C CNN
F 3 "~" H 2000 3150 50  0001 C CNN
	1    2000 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5D50763A
P 7800 5650
F 0 "#PWR0106" H 7800 5400 50  0001 C CNN
F 1 "GND" H 7805 5477 50  0000 C CNN
F 2 "" H 7800 5650 50  0001 C CNN
F 3 "" H 7800 5650 50  0001 C CNN
	1    7800 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C9
U 1 1 5D5078DF
P 7200 1800
F 0 "C9" H 7300 1900 50  0000 L CNN
F 1 "330uF" H 7300 1800 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P3.50mm" H 7200 1800 50  0001 C CNN
F 3 "~" H 7200 1800 50  0001 C CNN
	1    7200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5D507E46
P 6950 1800
F 0 "C10" H 6900 2100 50  0000 L CNN
F 1 "47uF" H 6900 2000 50  0000 L CNN
F 2 "UserLibrary:R_1206_HandSoldering" H 6950 1800 50  0001 C CNN
F 3 "~" H 6950 1800 50  0001 C CNN
	1    6950 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5D5084E1
P 6700 1800
F 0 "C11" H 6650 2100 50  0000 L CNN
F 1 "47uF" H 6650 2000 50  0000 L CNN
F 2 "UserLibrary:R_1206_HandSoldering" H 6700 1800 50  0001 C CNN
F 3 "~" H 6700 1800 50  0001 C CNN
	1    6700 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5D508774
P 6450 1800
F 0 "C12" H 6400 2100 50  0000 L CNN
F 1 "47uF" H 6400 2000 50  0000 L CNN
F 2 "UserLibrary:R_1206_HandSoldering" H 6450 1800 50  0001 C CNN
F 3 "~" H 6450 1800 50  0001 C CNN
	1    6450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1700 6700 1700
Connection ~ 6700 1700
Wire Wire Line
	6700 1700 6450 1700
Wire Wire Line
	6950 1700 7200 1700
Connection ~ 6950 1700
Wire Wire Line
	6450 1900 6700 1900
Connection ~ 6700 1900
Wire Wire Line
	6700 1900 6950 1900
Connection ~ 6950 1900
Wire Wire Line
	6950 1900 7200 1900
Connection ~ 6450 1700
Text Label 5700 1700 0    50   ~ 0
VOUT
$Comp
L power:GND #PWR0107
U 1 1 5D5111DC
P 6950 1900
F 0 "#PWR0107" H 6950 1650 50  0001 C CNN
F 1 "GND" H 6955 1727 50  0000 C CNN
F 2 "" H 6950 1900 50  0001 C CNN
F 3 "" H 6950 1900 50  0001 C CNN
	1    6950 1900
	1    0    0    -1  
$EndComp
NoConn ~ 7650 4400
Text Label 7650 4500 0    50   ~ 0
CLK
Text Label 7650 4600 0    50   ~ 0
A1
Text Label 7650 4700 0    50   ~ 0
A0
Text Label 7150 4500 2    50   ~ 0
D1
Text Label 7150 4400 2    50   ~ 0
D2
Text Label 7150 4700 2    50   ~ 0
LE
Text Label 7150 4600 2    50   ~ 0
OE
Text Label 10200 5200 0    50   ~ 0
D1
Text Label 10200 4000 0    50   ~ 0
LE
Text Label 10200 3800 0    50   ~ 0
A1
Text Label 10200 2450 0    50   ~ 0
CLK
Text Label 10200 2650 0    50   ~ 0
A0
Text Label 10200 1350 0    50   ~ 0
OE
Text Label 10200 1150 0    50   ~ 0
D2
Wire Wire Line
	7050 4400 7150 4400
Wire Wire Line
	7050 4500 7150 4500
Wire Wire Line
	7050 4600 7150 4600
Wire Wire Line
	7050 4700 7150 4700
Wire Wire Line
	7650 4500 7800 4500
Wire Wire Line
	7800 4600 7650 4600
Wire Wire Line
	7650 4700 7800 4700
Text Label 5000 5350 2    50   ~ 0
GND
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5D53C7B2
P 800 3100
F 0 "J4" H 900 3300 50  0000 C CNN
F 1 "JST_VH_2" H 900 3200 50  0000 C CNN
F 2 "Connectors_JST:JST_VH_B2PS-VH_2x2x3.96mm_Horizontal" H 800 3100 50  0001 C CNN
F 3 "~" H 800 3100 50  0001 C CNN
	1    800  3100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:MC78L05_TO92 U2
U 1 1 5D54089B
P 3750 2000
F 0 "U2" H 3750 2242 50  0000 C CNN
F 1 "MC78L05_TO92" H 3750 2151 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3750 2225 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM78L05A.pdf" H 3750 1950 50  0001 C CNN
	1    3750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2000 3400 2000
Wire Wire Line
	4050 2000 4100 2000
Wire Wire Line
	4300 2000 4300 2450
$Comp
L power:GND #PWR0110
U 1 1 5D5463EE
P 3750 2300
F 0 "#PWR0110" H 3750 2050 50  0001 C CNN
F 1 "GND" H 3755 2127 50  0000 C CNN
F 2 "" H 3750 2300 50  0001 C CNN
F 3 "" H 3750 2300 50  0001 C CNN
	1    3750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5D56D35F
P 3250 4350
F 0 "C13" V 3450 4350 50  0000 C CNN
F 1 "15nF" V 3350 4350 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3250 4350 50  0001 C CNN
F 3 "~" H 3250 4350 50  0001 C CNN
	1    3250 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 4350 3150 4500
Wire Wire Line
	3150 4500 2750 4500
Connection ~ 2750 4500
Wire Wire Line
	2750 4500 2750 4550
Wire Wire Line
	3350 4350 3750 4350
$Comp
L Device:R_Small R11
U 1 1 5D57C51C
P 3350 4150
F 0 "R11" V 3154 4150 50  0000 C CNN
F 1 "187K" V 3245 4150 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3350 4150 50  0001 C CNN
F 3 "~" H 3350 4150 50  0001 C CNN
	1    3350 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 4150 3450 4150
Wire Wire Line
	3250 4150 3150 4150
$Comp
L Device:R_Small R12
U 1 1 5D586C9F
P 3500 4700
F 0 "R12" H 3559 4746 50  0000 L CNN
F 1 "10K" H 3559 4655 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3500 4700 50  0001 C CNN
F 3 "~" H 3500 4700 50  0001 C CNN
	1    3500 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5D58741B
P 3500 5000
F 0 "R13" H 3559 5046 50  0000 L CNN
F 1 "1.78K" H 3559 4955 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3500 5000 50  0001 C CNN
F 3 "~" H 3500 5000 50  0001 C CNN
	1    3500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4600 3500 4500
Text Label 3500 4500 0    50   ~ 0
VOUT
Wire Wire Line
	3750 4450 3750 4850
Wire Wire Line
	3750 4850 3500 4850
Wire Wire Line
	3500 4850 3500 4800
Wire Wire Line
	3500 4850 3500 4900
Connection ~ 3500 4850
$Comp
L power:GND #PWR0113
U 1 1 5D5992B6
P 3500 5150
F 0 "#PWR0113" H 3500 4900 50  0001 C CNN
F 1 "GND" H 3505 4977 50  0000 C CNN
F 2 "" H 3500 5150 50  0001 C CNN
F 3 "" H 3500 5150 50  0001 C CNN
	1    3500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5100 3500 5150
Text Label 5000 5450 2    50   ~ 0
VOUT2
$Comp
L Device:R_Small R14
U 1 1 5D5C4D3E
P 3350 3800
F 0 "R14" V 3546 3800 50  0000 C CNN
F 1 "1.43K" V 3455 3800 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3350 3800 50  0001 C CNN
F 3 "~" H 3350 3800 50  0001 C CNN
	1    3350 3800
	0    -1   -1   0   
$EndComp
Text Label 3500 4850 2    50   ~ 0
FB
$Comp
L Device:R_Small R15
U 1 1 5D5CDE5A
P 5950 3700
F 0 "R15" V 5754 3700 50  0000 C CNN
F 1 "1.78K" V 5845 3700 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5950 3700 50  0001 C CNN
F 3 "~" H 5950 3700 50  0001 C CNN
	1    5950 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5D5CE4A5
P 6300 3700
F 0 "C14" V 6071 3700 50  0000 C CNN
F 1 "100nF" V 6162 3700 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6300 3700 50  0001 C CNN
F 3 "~" H 6300 3700 50  0001 C CNN
	1    6300 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5D5CEEAD
P 6150 3950
F 0 "C15" H 6242 3996 50  0000 L CNN
F 1 "10nF" H 6242 3905 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6150 3950 50  0001 C CNN
F 3 "~" H 6150 3950 50  0001 C CNN
	1    6150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3700 6550 3700
Wire Wire Line
	6550 3700 6550 3400
Wire Wire Line
	6150 3700 6150 3850
Wire Wire Line
	6150 4050 6150 4150
Wire Wire Line
	6150 4150 6300 4150
Text Label 6300 4150 2    50   ~ 0
FB
$Comp
L Device:R_Small R16
U 1 1 5D61C945
P 7950 3500
F 0 "R16" H 8009 3546 50  0000 L CNN
F 1 "470" H 8009 3455 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7950 3500 50  0001 C CNN
F 3 "~" H 7950 3500 50  0001 C CNN
	1    7950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5D61D111
P 7950 3750
F 0 "D2" V 7989 3633 50  0000 R CNN
F 1 "LED" V 7898 3633 50  0000 R CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 7950 3750 50  0001 C CNN
F 3 "~" H 7950 3750 50  0001 C CNN
	1    7950 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5D61F616
P 7950 3900
F 0 "#PWR0115" H 7950 3650 50  0001 C CNN
F 1 "GND" H 7955 3727 50  0000 C CNN
F 2 "" H 7950 3900 50  0001 C CNN
F 3 "" H 7950 3900 50  0001 C CNN
	1    7950 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 5D65019B
P 4100 2100
F 0 "C17" H 4192 2146 50  0000 L CNN
F 1 "22uF" H 4192 2055 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4100 2100 50  0001 C CNN
F 3 "~" H 4100 2100 50  0001 C CNN
	1    4100 2100
	1    0    0    -1  
$EndComp
Connection ~ 4100 2000
Wire Wire Line
	4100 2000 4300 2000
$Comp
L Device:C_Small C16
U 1 1 5D65166D
P 3400 2100
F 0 "C16" H 3150 2150 50  0000 L CNN
F 1 "10uF" H 3100 2050 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 3400 2100 50  0001 C CNN
F 3 "~" H 3400 2100 50  0001 C CNN
	1    3400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3050 3500 3050
Wire Wire Line
	3400 2000 2900 2000
Wire Wire Line
	2900 2000 2900 3050
Connection ~ 3400 2000
Connection ~ 2900 3050
Wire Wire Line
	2900 3050 2750 3050
Wire Wire Line
	4100 2200 4100 2300
Wire Wire Line
	4100 2300 3750 2300
Wire Wire Line
	3400 2300 3400 2200
Connection ~ 3750 2300
Wire Wire Line
	3750 2300 3400 2300
$Comp
L Device:C_Small C18
U 1 1 5D6CC9B4
P 6200 1800
F 0 "C18" H 6150 2100 50  0000 L CNN
F 1 "47uF" H 6150 2000 50  0000 L CNN
F 2 "UserLibrary:R_1206_HandSoldering" H 6200 1800 50  0001 C CNN
F 3 "~" H 6200 1800 50  0001 C CNN
	1    6200 1800
	1    0    0    -1  
$EndComp
Connection ~ 6200 1700
Wire Wire Line
	6200 1700 6450 1700
Wire Wire Line
	6450 1900 6200 1900
Connection ~ 6450 1900
Wire Wire Line
	5950 1700 6200 1700
$Comp
L Device:C_Small C19
U 1 1 5D6DBE75
P 5950 1800
F 0 "C19" H 5900 2100 50  0000 L CNN
F 1 "22uF" H 5900 2000 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5950 1800 50  0001 C CNN
F 3 "~" H 5950 1800 50  0001 C CNN
	1    5950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1900 5950 1900
Connection ~ 6200 1900
Wire Wire Line
	5950 1700 5700 1700
Connection ~ 5950 1700
$Comp
L Device:R_Small R4
U 1 1 5D8E5E63
P 5700 5350
F 0 "R4" V 5700 5800 50  0000 C CNN
F 1 "470" V 5700 5650 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5350 50  0001 C CNN
F 3 "~" H 5700 5350 50  0001 C CNN
	1    5700 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5D8E5E6D
P 5700 5450
F 0 "R5" V 5700 5900 50  0000 C CNN
F 1 "470" V 5700 5750 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5450 50  0001 C CNN
F 3 "~" H 5700 5450 50  0001 C CNN
	1    5700 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5D8E5E77
P 5700 5550
F 0 "R6" V 5700 6000 50  0000 C CNN
F 1 "470" V 5700 5850 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5550 50  0001 C CNN
F 3 "~" H 5700 5550 50  0001 C CNN
	1    5700 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5D8E5E81
P 5700 5650
F 0 "R7" V 5700 6100 50  0000 C CNN
F 1 "470" V 5700 5950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5650 50  0001 C CNN
F 3 "~" H 5700 5650 50  0001 C CNN
	1    5700 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5D8E5E8B
P 5700 5750
F 0 "R8" V 5700 6200 50  0000 C CNN
F 1 "470" V 5700 6050 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5750 50  0001 C CNN
F 3 "~" H 5700 5750 50  0001 C CNN
	1    5700 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5D8E5E95
P 5700 5850
F 0 "R9" V 5700 6300 50  0000 C CNN
F 1 "470" V 5700 6150 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5850 50  0001 C CNN
F 3 "~" H 5700 5850 50  0001 C CNN
	1    5700 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5D8E5E9F
P 5700 5950
F 0 "R10" V 5700 6400 50  0000 C CNN
F 1 "470" V 5700 6250 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5700 5950 50  0001 C CNN
F 3 "~" H 5700 5950 50  0001 C CNN
	1    5700 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 5550 5500 5550
Wire Wire Line
	5500 5550 5500 5650
$Comp
L power:GND #PWR0108
U 1 1 5D8F5BF7
P 5500 6000
F 0 "#PWR0108" H 5500 5750 50  0001 C CNN
F 1 "GND" H 5505 5827 50  0000 C CNN
F 2 "" H 5500 6000 50  0001 C CNN
F 3 "" H 5500 6000 50  0001 C CNN
	1    5500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5650 5500 5650
Connection ~ 5500 5650
Wire Wire Line
	5500 5650 5500 5750
Wire Wire Line
	5600 5750 5500 5750
Connection ~ 5500 5750
Wire Wire Line
	5500 5750 5500 5850
Wire Wire Line
	5600 5850 5500 5850
Connection ~ 5500 5850
Wire Wire Line
	5500 5850 5500 5950
Wire Wire Line
	5600 5950 5500 5950
Connection ~ 5500 5950
Wire Wire Line
	5500 5950 5500 6000
Wire Wire Line
	5000 5450 5600 5450
Wire Wire Line
	5600 5350 5000 5350
NoConn ~ 10200 5400
Text Label 8950 1350 2    50   ~ 0
IN_OE
Text Label 8950 2650 2    50   ~ 0
IN_A0
Text Label 8950 2450 2    50   ~ 0
IN_CLK
Text Label 8950 3800 2    50   ~ 0
IN_A1
Text Label 8950 4000 2    50   ~ 0
IN_LE
Text Label 8950 5200 2    50   ~ 0
IN_D1
Text Label 5800 5950 0    50   ~ 0
IN_D1
Text Label 5800 5850 0    50   ~ 0
IN_LE
Text Label 5800 5750 0    50   ~ 0
IN_A1
Text Label 5800 5650 0    50   ~ 0
IN_CLK
Text Label 5800 5550 0    50   ~ 0
IN_A0
Text Label 5800 5450 0    50   ~ 0
IN_OE
Text Label 5800 5350 0    50   ~ 0
IN_D2
Wire Wire Line
	5800 5950 6050 5950
Wire Wire Line
	6050 5850 5800 5850
Wire Wire Line
	5800 5750 6050 5750
Wire Wire Line
	6050 5650 5800 5650
Wire Wire Line
	5800 5550 6050 5550
Wire Wire Line
	6050 5450 5800 5450
Wire Wire Line
	5800 5350 6050 5350
$Comp
L Connector:Conn_01x07_Male J3
U 1 1 5D513286
P 6250 5650
F 0 "J3" H 6222 5674 50  0000 R CNN
F 1 "JST_PH_7" H 6222 5583 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_B7B-PH-K_07x2.00mm_Straight" H 6250 5650 50  0001 C CNN
F 3 "~" H 6250 5650 50  0001 C CNN
	1    6250 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 5DA66E2A
P 8150 1100
F 0 "C20" H 8242 1146 50  0000 L CNN
F 1 "22uF" H 8242 1055 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 8150 1100 50  0001 C CNN
F 3 "~" H 8150 1100 50  0001 C CNN
	1    8150 1100
	1    0    0    -1  
$EndComp
Text Label 7950 1000 2    50   ~ 0
VOUT
Text Label 9150 5400 2    50   ~ 0
GND
$Comp
L 74xGxx:74LVC2G17GW U3
U 1 1 5D60BE5F
P 9700 1250
F 0 "U3" H 9950 1500 50  0000 C CNN
F 1 "74LVC2G17GW" H 9950 950 50  0000 C CNN
F 2 "UserLibrary:SOT-363" H 9700 1150 50  0001 C CNN
F 3 "" H 9700 1150 50  0001 C CNN
	1    9700 1250
	1    0    0    -1  
$EndComp
Text Label 9650 850  0    50   ~ 0
VOUT2
$Comp
L power:GND #PWR0109
U 1 1 5D60ECC5
P 9650 1650
F 0 "#PWR0109" H 9650 1400 50  0001 C CNN
F 1 "GND" H 9655 1477 50  0000 C CNN
F 2 "" H 9650 1650 50  0001 C CNN
F 3 "" H 9650 1650 50  0001 C CNN
	1    9650 1650
	1    0    0    -1  
$EndComp
Text Label 8950 1150 2    50   ~ 0
IN_D2
$Comp
L 74xGxx:74LVC2G17GW U6
U 1 1 5D6226BD
P 9700 5300
F 0 "U6" H 9950 5550 50  0000 C CNN
F 1 "74LVC2G17GW" H 9950 5000 50  0000 C CNN
F 2 "UserLibrary:SOT-363" H 9700 5200 50  0001 C CNN
F 3 "" H 9700 5200 50  0001 C CNN
	1    9700 5300
	1    0    0    -1  
$EndComp
Text Label 9650 4900 0    50   ~ 0
VOUT2
$Comp
L power:GND #PWR0114
U 1 1 5D6226C8
P 9650 5700
F 0 "#PWR0114" H 9650 5450 50  0001 C CNN
F 1 "GND" H 9655 5527 50  0000 C CNN
F 2 "" H 9650 5700 50  0001 C CNN
F 3 "" H 9650 5700 50  0001 C CNN
	1    9650 5700
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW U5
U 1 1 5D62C4CA
P 9700 3900
F 0 "U5" H 9950 4150 50  0000 C CNN
F 1 "74LVC2G17GW" H 9950 3600 50  0000 C CNN
F 2 "UserLibrary:SOT-363" H 9700 3800 50  0001 C CNN
F 3 "" H 9700 3800 50  0001 C CNN
	1    9700 3900
	1    0    0    -1  
$EndComp
Text Label 9650 3500 0    50   ~ 0
VOUT2
$Comp
L power:GND #PWR0117
U 1 1 5D62C4D5
P 9650 4300
F 0 "#PWR0117" H 9650 4050 50  0001 C CNN
F 1 "GND" H 9655 4127 50  0000 C CNN
F 2 "" H 9650 4300 50  0001 C CNN
F 3 "" H 9650 4300 50  0001 C CNN
	1    9650 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW U4
U 1 1 5D63D11B
P 9700 2550
F 0 "U4" H 9950 2800 50  0000 C CNN
F 1 "74LVC2G17GW" H 9950 2250 50  0000 C CNN
F 2 "UserLibrary:SOT-363" H 9700 2450 50  0001 C CNN
F 3 "" H 9700 2450 50  0001 C CNN
	1    9700 2550
	1    0    0    -1  
$EndComp
Text Label 9650 2150 0    50   ~ 0
VOUT2
$Comp
L power:GND #PWR0118
U 1 1 5D63D126
P 9650 2950
F 0 "#PWR0118" H 9650 2700 50  0001 C CNN
F 1 "GND" H 9655 2777 50  0000 C CNN
F 2 "" H 9650 2950 50  0001 C CNN
F 3 "" H 9650 2950 50  0001 C CNN
	1    9650 2950
	1    0    0    -1  
$EndComp
Text Label 1000 3200 0    50   ~ 0
VIN
Text Label 1000 3100 0    50   ~ 0
GND
$Comp
L Device:CP_Small C21
U 1 1 5D61F482
P 1750 3150
F 0 "C21" H 1650 3450 50  0000 L CNN
F 1 "330uF" H 1600 3350 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P3.50mm" H 1750 3150 50  0001 C CNN
F 3 "~" H 1750 3150 50  0001 C CNN
	1    1750 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C25
U 1 1 5D645122
P 2500 3150
F 0 "C25" H 2450 3450 50  0000 L CNN
F 1 "10uF" H 2450 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 2500 3150 50  0001 C CNN
F 3 "~" H 2500 3150 50  0001 C CNN
	1    2500 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 5D64C70A
P 2250 3150
F 0 "C24" H 2200 3450 50  0000 L CNN
F 1 "10uF" H 2200 3350 50  0000 L CNN
F 2 "UserLibrary:R_0805_HandSoldering2" H 2250 3150 50  0001 C CNN
F 3 "~" H 2250 3150 50  0001 C CNN
	1    2250 3150
	1    0    0    -1  
$EndComp
Connection ~ 2750 3050
Connection ~ 2250 3050
Wire Wire Line
	2250 3050 2500 3050
Connection ~ 2500 3050
Wire Wire Line
	2500 3050 2750 3050
Connection ~ 2750 3250
Connection ~ 2250 3250
Wire Wire Line
	2250 3250 2500 3250
Connection ~ 2500 3250
Wire Wire Line
	2500 3250 2750 3250
$Comp
L Device:R_Small R17
U 1 1 5D68EDB8
P 8050 1000
F 0 "R17" V 7854 1000 50  0000 C CNN
F 1 "5" V 7945 1000 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 8050 1000 50  0001 C CNN
F 3 "~" H 8050 1000 50  0001 C CNN
	1    8050 1000
	0    1    1    0   
$EndComp
Text Label 8150 1000 0    50   ~ 0
VOUT2
$Comp
L power:GND #PWR0116
U 1 1 5D7501AD
P 5450 4550
F 0 "#PWR0116" H 5450 4300 50  0001 C CNN
F 1 "GND" H 5455 4377 50  0000 C CNN
F 2 "" H 5450 4550 50  0001 C CNN
F 3 "" H 5450 4550 50  0001 C CNN
	1    5450 4550
	1    0    0    -1  
$EndComp
Text Notes 5900 4600 0    50   ~ 0
Snubber, may \nneed adjusting
Wire Notes Line
	5200 4800 5200 3900
Wire Notes Line
	5850 3900 5850 4800
Connection ~ 6550 3400
Wire Wire Line
	6050 3700 6150 3700
Wire Wire Line
	5700 3700 5850 3700
Connection ~ 6150 3700
Wire Wire Line
	6150 3700 6200 3700
Wire Wire Line
	5050 3300 5250 3300
Connection ~ 5050 3400
Wire Wire Line
	5250 3050 5250 3300
Wire Notes Line
	8650 650  10500 650 
Wire Notes Line
	10500 650  10500 6100
Wire Notes Line
	10500 6100 8650 6100
Wire Notes Line
	8650 6100 8650 650 
Text Notes 8600 3000 1    50   ~ 0
Optional Schmitt Triggers
$Comp
L power:GND #PWR0112
U 1 1 5D57FC6C
P 3050 3950
F 0 "#PWR0112" H 3050 3700 50  0001 C CNN
F 1 "GND" H 3055 3777 50  0000 C CNN
F 2 "" H 3050 3950 50  0001 C CNN
F 3 "" H 3050 3950 50  0001 C CNN
	1    3050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3950 3050 3950
Wire Wire Line
	3150 3950 3150 4150
$Comp
L power:GND #PWR0119
U 1 1 5D98FB9F
P 7000 5650
F 0 "#PWR0119" H 7000 5400 50  0001 C CNN
F 1 "GND" H 7005 5477 50  0000 C CNN
F 2 "" H 7000 5650 50  0001 C CNN
F 3 "" H 7000 5650 50  0001 C CNN
	1    7000 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5D9902C9
P 8150 1200
F 0 "#PWR0120" H 8150 950 50  0001 C CNN
F 1 "GND" H 8155 1027 50  0000 C CNN
F 2 "" H 8150 1200 50  0001 C CNN
F 3 "" H 8150 1200 50  0001 C CNN
	1    8150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3400 6550 3400
Wire Wire Line
	2750 3550 3750 3550
Wire Wire Line
	2750 3550 2750 3950
Wire Wire Line
	3750 4050 3550 4050
Wire Wire Line
	3550 4050 3550 3800
Wire Wire Line
	3550 3800 3450 3800
Wire Wire Line
	3250 3800 3050 3800
Wire Wire Line
	5700 3700 5700 3400
Connection ~ 5700 3400
Wire Wire Line
	5700 3400 6000 3400
Wire Wire Line
	5050 3400 5450 3400
Wire Wire Line
	5450 3400 5450 3950
Connection ~ 5450 3400
Wire Wire Line
	5450 3400 5700 3400
Text Label 3050 3800 0    50   ~ 0
SW
$Comp
L Device:R_Small R19
U 1 1 5D72E603
P 5300 4400
F 0 "R19" H 5150 4350 50  0000 C CNN
F 1 "3.3" H 5150 4450 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5300 4400 50  0001 C CNN
F 3 "~" H 5300 4400 50  0001 C CNN
	1    5300 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C27
U 1 1 5D73F0C8
P 5300 4100
F 0 "C27" H 5150 4050 50  0000 C CNN
F 1 "1nF" H 5150 4150 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5300 4100 50  0001 C CNN
F 3 "~" H 5300 4100 50  0001 C CNN
	1    5300 4100
	-1   0    0    1   
$EndComp
Text Notes 1450 2750 0    50   ~ 0
Multiple electrolytics to \nshare ripple current
Text Notes 5850 3150 0    50   ~ 0
Tested with \nSRP1250-2R2M
Text Notes 2850 5600 0    50   ~ 0
Adjust R13 to change output voltage\nR13 = 6000 / (VOUT-0.6)
$Comp
L Device:R_Small R25
U 1 1 5D6C845D
P 9050 5200
F 0 "R25" V 9150 5050 50  0000 C CNN
F 1 "470" V 9150 5200 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 5200 50  0001 C CNN
F 3 "~" H 9050 5200 50  0001 C CNN
	1    9050 5200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R24
U 1 1 5D6D996E
P 9050 4000
F 0 "R24" V 9150 3850 50  0000 C CNN
F 1 "470" V 9150 4000 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 4000 50  0001 C CNN
F 3 "~" H 9050 4000 50  0001 C CNN
	1    9050 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R23
U 1 1 5D6DA0CD
P 9050 3800
F 0 "R23" V 9150 3650 50  0000 C CNN
F 1 "470" V 9150 3800 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 3800 50  0001 C CNN
F 3 "~" H 9050 3800 50  0001 C CNN
	1    9050 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R22
U 1 1 5D6DA3AC
P 9050 2650
F 0 "R22" V 9150 2500 50  0000 C CNN
F 1 "470" V 9150 2650 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 2650 50  0001 C CNN
F 3 "~" H 9050 2650 50  0001 C CNN
	1    9050 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 5D6DA815
P 9050 2450
F 0 "R21" V 9150 2300 50  0000 C CNN
F 1 "470" V 9150 2450 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 2450 50  0001 C CNN
F 3 "~" H 9050 2450 50  0001 C CNN
	1    9050 2450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 5D6DAA2C
P 9050 1350
F 0 "R20" V 9150 1200 50  0000 C CNN
F 1 "470" V 9150 1350 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 1350 50  0001 C CNN
F 3 "~" H 9050 1350 50  0001 C CNN
	1    9050 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5D6DB050
P 9050 1150
F 0 "R18" V 9150 1000 50  0000 C CNN
F 1 "470" V 9150 1150 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 9050 1150 50  0001 C CNN
F 3 "~" H 9050 1150 50  0001 C CNN
	1    9050 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 2600 5700 2600
Wire Wire Line
	5800 2800 5700 2800
Connection ~ 5700 2800
Wire Wire Line
	5700 2800 5700 3400
Wire Wire Line
	5700 2600 5700 2800
Wire Notes Line
	6650 2900 5600 2900
Wire Notes Line
	5600 2400 6650 2400
Wire Notes Line
	6650 2900 6650 2400
Wire Notes Line
	5600 2900 5600 2400
Text Notes 5800 2350 0    50   ~ 0
Optional snubber
$Comp
L Device:C_Small C26
U 1 1 5D6E34A8
P 6250 2700
F 0 "C26" V 6300 2850 50  0000 C CNN
F 1 "4.7nF" V 6200 2850 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 6250 2700 50  0001 C CNN
F 3 "~" H 6250 2700 50  0001 C CNN
	1    6250 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R27
U 1 1 5D6EEE72
P 5900 2800
F 0 "R27" V 5800 2900 50  0000 C CNN
F 1 "68" V 5800 2750 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5900 2800 50  0001 C CNN
F 3 "~" H 5900 2800 50  0001 C CNN
	1    5900 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R26
U 1 1 5D6E2E88
P 5900 2600
F 0 "R26" V 5800 2700 50  0000 C CNN
F 1 "68" V 5800 2550 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5900 2600 50  0001 C CNN
F 3 "~" H 5900 2600 50  0001 C CNN
	1    5900 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R28
U 1 1 5D6F2B19
P 5600 4400
F 0 "R28" H 5450 4350 50  0000 C CNN
F 1 "3.3" H 5450 4450 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5600 4400 50  0001 C CNN
F 3 "~" H 5600 4400 50  0001 C CNN
	1    5600 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 4500 5600 4550
Wire Wire Line
	5600 4550 5450 4550
Wire Wire Line
	5300 4500 5300 4550
Wire Wire Line
	5300 4550 5450 4550
Connection ~ 5450 4550
Wire Notes Line
	5200 3900 5850 3900
Wire Notes Line
	5200 4800 5850 4800
$Comp
L Device:C_Small C28
U 1 1 5D6F51E2
P 5600 4100
F 0 "C28" H 5450 4050 50  0000 C CNN
F 1 "1nF" H 5450 4150 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5600 4100 50  0001 C CNN
F 3 "~" H 5600 4100 50  0001 C CNN
	1    5600 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 4000 5600 3950
Wire Wire Line
	5600 3950 5450 3950
Wire Wire Line
	5450 3950 5300 3950
Wire Wire Line
	5300 3950 5300 4000
Connection ~ 5450 3950
Wire Wire Line
	6000 2800 6150 2800
Wire Wire Line
	6000 2600 6150 2600
Wire Wire Line
	6150 2600 6150 2700
Wire Wire Line
	5600 4200 5600 4300
Wire Wire Line
	5300 4200 5300 4300
Connection ~ 6150 2700
Wire Wire Line
	6150 2700 6150 2800
Wire Wire Line
	6550 2700 6350 2700
Wire Wire Line
	6550 2700 6550 3400
Wire Wire Line
	1450 3250 1750 3250
Wire Wire Line
	1750 3050 2000 3050
Connection ~ 1750 3250
Wire Wire Line
	1750 3250 2000 3250
Connection ~ 2000 3050
Wire Wire Line
	2000 3050 2250 3050
Connection ~ 2000 3250
Wire Wire Line
	2000 3250 2250 3250
Wire Wire Line
	1750 3050 1450 3050
Connection ~ 1750 3050
Wire Wire Line
	6550 3400 7150 3400
$EndSCHEMATC
