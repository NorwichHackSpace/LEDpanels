EESchema Schematic File Version 4
LIBS:LEDPanelController-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
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
L Connector:Conn_01x07_Male J1
U 1 1 5D6FA668
P 9000 2000
F 0 "J1" H 9200 1450 50  0000 R CNN
F 1 "JST_PH_7" H 9250 1550 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 9000 2000 50  0001 C CNN
F 3 "~" H 9000 2000 50  0001 C CNN
	1    9000 2000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x07_Male J5
U 1 1 5D6FF2D4
P 11750 2000
F 0 "J5" H 11950 1450 50  0000 R CNN
F 1 "JST_PH_7" H 11950 1550 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 11750 2000 50  0001 C CNN
F 3 "~" H 11750 2000 50  0001 C CNN
	1    11750 2000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x07_Male J3
U 1 1 5D700018
P 8750 6900
F 0 "J3" H 8950 6350 50  0000 R CNN
F 1 "JST_PH_7" H 9000 6450 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 8750 6900 50  0001 C CNN
F 3 "~" H 8750 6900 50  0001 C CNN
	1    8750 6900
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x07_Male J7
U 1 1 5D701748
P 11500 6950
F 0 "J7" H 11650 6450 50  0000 C CNN
F 1 "JST_PH_7" H 11550 6550 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 11500 6950 50  0001 C CNN
F 3 "~" H 11500 6950 50  0001 C CNN
	1    11500 6950
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x12_Top_Bottom J10
U 1 1 5D702EA5
P 2650 3550
F 0 "J10" H 2700 4267 50  0000 C CNN
F 1 "24Pin" H 2700 4176 50  0000 C CNN
F 2 "Connectors_Molex:Molex_MiniFit-JR-5569-24A2_2x12x4.20mm_Angled" H 2650 3550 50  0001 C CNN
F 3 "~" H 2650 3550 50  0001 C CNN
	1    2650 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 5D707527
P 1200 1750
F 0 "J9" V 1050 1700 50  0000 C CNN
F 1 "JST_VH_2" V 1150 1700 50  0000 C CNN
F 2 "Connectors_JST:JST_VH_B2P-VH-B_2x3.96mm_Vertical" H 1200 1750 50  0001 C CNN
F 3 "~" H 1200 1750 50  0001 C CNN
	1    1200 1750
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 5D708911
P 1700 1750
F 0 "J11" V 1550 1650 50  0000 L CNN
F 1 "JST_VH_2" V 1650 1550 50  0000 L CNN
F 2 "Connectors_JST:JST_VH_B2P-VH-B_2x3.96mm_Vertical" H 1700 1750 50  0001 C CNN
F 3 "~" H 1700 1750 50  0001 C CNN
	1    1700 1750
	0    1    1    0   
$EndComp
Text Label 8800 1700 2    50   ~ 0
DATA1_D1
Text Label 8800 1800 2    50   ~ 0
DATA1_LE
Text Label 8800 1900 2    50   ~ 0
DATA1_A1
Text Label 8800 2000 2    50   ~ 0
DATA1_CLK
Text Label 8800 2100 2    50   ~ 0
DATA1_A0
Text Label 8800 2200 2    50   ~ 0
DATA1_OE
Text Label 8800 2300 2    50   ~ 0
DATA1_D2
Text Label 6950 2750 2    50   ~ 0
OUT1_D2
Text Label 6950 1100 2    50   ~ 0
OUT1_D1
$Comp
L power:GND #PWR0101
U 1 1 5D6EA8EB
P 3350 8600
F 0 "#PWR0101" H 3350 8350 50  0001 C CNN
F 1 "GND" H 3355 8427 50  0000 C CNN
F 2 "" H 3350 8600 50  0001 C CNN
F 3 "" H 3350 8600 50  0001 C CNN
	1    3350 8600
	1    0    0    -1  
$EndComp
Connection ~ 3350 8550
Wire Wire Line
	3350 8550 3350 8600
Wire Wire Line
	3250 8550 3350 8550
Connection ~ 3250 8550
Wire Wire Line
	3150 8550 3250 8550
Connection ~ 3150 8550
Wire Wire Line
	3050 8550 3150 8550
Text Label 2550 7250 2    50   ~ 0
OUT8_D2
Text Label 2550 8350 2    50   ~ 0
OUT8_D1
Text Label 2550 7150 2    50   ~ 0
OUT7_D2
Text Label 2550 7350 2    50   ~ 0
OUT7_D1
Text Label 2550 7650 2    50   ~ 0
OUT6_D2
Text Label 2550 7450 2    50   ~ 0
OUT6_D1
Text Label 2550 7550 2    50   ~ 0
OUT5_D2
Text Label 2550 7750 2    50   ~ 0
OUT5_D1
Text Label 2550 8150 2    50   ~ 0
OUT4_D2
Text Label 2550 7950 2    50   ~ 0
OUT4_D1
Text Label 2550 8050 2    50   ~ 0
OUT3_D2
Text Label 2550 8250 2    50   ~ 0
OUT3_D1
Text Label 2550 7050 2    50   ~ 0
OUT2_D2
Text Label 2550 6850 2    50   ~ 0
OUT2_D1
Text Label 2550 6950 2    50   ~ 0
OUT1_D2
Text Label 2550 7850 2    50   ~ 0
OUT1_D1
$Comp
L MCU_ST_STM32L0:STM32L031C6Tx U9
U 1 1 5D6E8ACC
P 3150 6950
F 0 "U9" H 3150 7700 50  0000 C CNN
F 1 "STM32L031C6Tx" V 3150 6950 50  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 2650 5450 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00140359.pdf" H 3150 6950 50  0001 C CNN
	1    3150 6950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x07_Male J2
U 1 1 5D7483E5
P 8750 4450
F 0 "J2" H 8950 3900 50  0000 R CNN
F 1 "JST_PH_7" H 8950 4000 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 8750 4450 50  0001 C CNN
F 3 "~" H 8750 4450 50  0001 C CNN
	1    8750 4450
	-1   0    0    1   
$EndComp
Text Label 6950 3550 2    50   ~ 0
OUT2_D1
$Comp
L Connector:Conn_01x07_Male J4
U 1 1 5D74BBCF
P 8750 9350
F 0 "J4" H 8950 8800 50  0000 R CNN
F 1 "JST_PH_7" H 9000 8900 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 8750 9350 50  0001 C CNN
F 3 "~" H 8750 9350 50  0001 C CNN
	1    8750 9350
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x07_Male J6
U 1 1 5D75C8CE
P 11750 4500
F 0 "J6" H 11950 3950 50  0000 R CNN
F 1 "JST_PH_7" H 11950 4050 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 11750 4500 50  0001 C CNN
F 3 "~" H 11750 4500 50  0001 C CNN
	1    11750 4500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x07_Male J8
U 1 1 5D76B26D
P 11500 9400
F 0 "J8" H 11650 8900 50  0000 C CNN
F 1 "JST_PH_7" H 11550 9000 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_S7B-PH-SM4-TB_07x2.00mm_Angled" H 11500 9400 50  0001 C CNN
F 3 "~" H 11500 9400 50  0001 C CNN
	1    11500 9400
	-1   0    0    1   
$EndComp
Text Label 6950 7650 2    50   ~ 0
OUT3_D2
Text Label 6950 6000 2    50   ~ 0
OUT3_D1
Text Label 6950 10100 2    50   ~ 0
OUT4_D2
Text Label 6950 8450 2    50   ~ 0
OUT4_D1
Text Label 9700 2750 2    50   ~ 0
OUT5_D2
Text Label 9700 1100 2    50   ~ 0
OUT5_D1
Text Label 9700 7700 2    50   ~ 0
OUT7_D2
Text Label 9700 6050 2    50   ~ 0
OUT7_D1
Text Label 9700 3600 2    50   ~ 0
OUT6_D1
Text Label 9700 10150 2    50   ~ 0
OUT8_D2
Text Label 9700 8500 2    50   ~ 0
OUT8_D1
Wire Wire Line
	3350 5450 3250 5450
Connection ~ 3150 5450
Wire Wire Line
	3150 5450 3050 5450
Connection ~ 3250 5450
Wire Wire Line
	3250 5450 3150 5450
Wire Wire Line
	3150 5450 3150 5150
Wire Wire Line
	3150 5150 2550 5150
$Comp
L Device:C_Small C9
U 1 1 5D7E77C7
P 2550 5250
F 0 "C9" H 2500 5500 50  0000 L CNN
F 1 "22uF" H 2450 5400 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2550 5250 50  0001 C CNN
F 3 "~" H 2550 5250 50  0001 C CNN
	1    2550 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5D7E7D9A
P 2300 5250
F 0 "C8" H 2250 5500 50  0000 L CNN
F 1 "22uF" H 2200 5400 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2300 5250 50  0001 C CNN
F 3 "~" H 2300 5250 50  0001 C CNN
	1    2300 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5D7E85DD
P 2050 5250
F 0 "C6" H 2000 5500 50  0000 L CNN
F 1 "22uF" H 1950 5400 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2050 5250 50  0001 C CNN
F 3 "~" H 2050 5250 50  0001 C CNN
	1    2050 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5D7E89FD
P 1800 5250
F 0 "C5" H 1750 5500 50  0000 L CNN
F 1 "22uF" H 1700 5400 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 1800 5250 50  0001 C CNN
F 3 "~" H 1800 5250 50  0001 C CNN
	1    1800 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5150 2300 5150
Connection ~ 2550 5150
Connection ~ 2050 5150
Wire Wire Line
	2050 5150 1800 5150
Connection ~ 2300 5150
Wire Wire Line
	2300 5150 2050 5150
Text Label 3100 5150 2    50   ~ 0
3V3SB
Wire Wire Line
	1800 5350 2050 5350
Connection ~ 2050 5350
Wire Wire Line
	2050 5350 2300 5350
Connection ~ 2300 5350
Wire Wire Line
	2300 5350 2550 5350
Wire Wire Line
	1800 5350 1800 5850
Wire Wire Line
	1800 5850 2250 5850
Connection ~ 1800 5350
$Comp
L power:GND #PWR0111
U 1 1 5D7EE927
P 1800 5850
F 0 "#PWR0111" H 1800 5600 50  0001 C CNN
F 1 "GND" H 1805 5677 50  0000 C CNN
F 2 "" H 1800 5850 50  0001 C CNN
F 3 "" H 1800 5850 50  0001 C CNN
	1    1800 5850
	1    0    0    -1  
$EndComp
Connection ~ 1800 5850
$Comp
L Device:C_Small C7
U 1 1 5D7EF515
P 2250 5750
F 0 "C7" H 2200 6000 50  0000 L CNN
F 1 "100nF" H 2150 5900 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 2250 5750 50  0001 C CNN
F 3 "~" H 2250 5750 50  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
Connection ~ 2250 5850
Wire Wire Line
	2250 5850 2550 5850
Wire Wire Line
	2550 5650 2250 5650
Text Label 2550 5650 2    50   ~ 0
RST
Text Label 3750 8150 0    50   ~ 0
SWD
Text Label 3750 8250 0    50   ~ 0
SWC
Text Label 3750 6950 0    50   ~ 0
PWR_ON
Text Label 3750 7350 0    50   ~ 0
SCK
Text Label 3750 7450 0    50   ~ 0
MISO
Text Label 3750 7550 0    50   ~ 0
MOSI
Text Label 3750 7950 0    50   ~ 0
OUT_OE
Text Label 2550 6050 2    50   ~ 0
OUT_A0
Text Label 2550 6150 2    50   ~ 0
OUT_A1
Text Label 2550 6350 2    50   ~ 0
OUT_CLK
Text Label 2550 6450 2    50   ~ 0
OUT_LE
Text Label 2450 3050 2    50   ~ 0
3V3
Text Label 2450 3150 2    50   ~ 0
3V3
Text Label 2450 3250 2    50   ~ 0
GND
Text Label 2450 3450 2    50   ~ 0
GND
Text Label 2450 3650 2    50   ~ 0
GND
Text Label 2450 3950 2    50   ~ 0
12V
Text Label 2450 4050 2    50   ~ 0
12V
Text Label 2950 3050 0    50   ~ 0
3V3
Text Label 2950 3250 0    50   ~ 0
GND
Text Label 2950 3350 0    50   ~ 0
PWR_ON
Text Label 2950 3450 0    50   ~ 0
GND
Text Label 2950 3550 0    50   ~ 0
GND
Text Label 2950 3650 0    50   ~ 0
GND
Text Label 2950 4150 0    50   ~ 0
GND
NoConn ~ 2450 3750
NoConn ~ 2950 3150
Text Label 1200 1950 3    50   ~ 0
12V
Text Label 1100 1950 3    50   ~ 0
GND
Text Label 1700 1950 3    50   ~ 0
12V
Text Label 1600 1950 3    50   ~ 0
GND
$Comp
L RF_Module:RFM69W U10
U 1 1 5D85545B
P 5150 7650
F 0 "U10" H 5500 8100 50  0000 C CNN
F 1 "RFM69W" H 4900 7200 50  0000 C CNN
F 2 "UserLibrary:RFM69" H 5150 7050 50  0001 C CNN
F 3 "https://www.hoperf.com/data/upload/portal/20181127/5bfcbe34756e1.pdf" H 5150 7350 50  0001 C CNN
	1    5150 7650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5D856C2B
P 4900 6950
F 0 "C16" H 4850 7200 50  0000 L CNN
F 1 "22uF" H 4800 7100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4900 6950 50  0001 C CNN
F 3 "~" H 4900 6950 50  0001 C CNN
	1    4900 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5D857831
P 4700 6950
F 0 "C15" H 4650 7200 50  0000 L CNN
F 1 "47uF" H 4600 7100 50  0000 L CNN
F 2 "UserLibrary:R_1206_HandSoldering" H 4700 6950 50  0001 C CNN
F 3 "~" H 4700 6950 50  0001 C CNN
	1    4700 6950
	1    0    0    -1  
$EndComp
Text Label 5150 6850 3    50   ~ 0
3V3SB
Text Label 4900 7050 2    50   ~ 0
GND
Wire Wire Line
	4900 7050 4700 7050
Wire Wire Line
	5150 6850 4900 6850
Wire Wire Line
	5150 6850 5150 7150
Connection ~ 4900 6850
Wire Wire Line
	4900 6850 4700 6850
$Comp
L power:GND #PWR0112
U 1 1 5D871051
P 4900 7050
F 0 "#PWR0112" H 4900 6800 50  0001 C CNN
F 1 "GND" H 4800 6950 50  0000 C CNN
F 2 "" H 4900 7050 50  0001 C CNN
F 3 "" H 4900 7050 50  0001 C CNN
	1    4900 7050
	1    0    0    -1  
$EndComp
Connection ~ 4900 7050
$Comp
L power:GND #PWR0113
U 1 1 5D8716A8
P 5250 8150
F 0 "#PWR0113" H 5250 7900 50  0001 C CNN
F 1 "GND" H 5255 7977 50  0000 C CNN
F 2 "" H 5250 8150 50  0001 C CNN
F 3 "" H 5250 8150 50  0001 C CNN
	1    5250 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7350 4650 7350
Wire Wire Line
	3750 7450 4650 7450
Wire Wire Line
	3750 7550 4650 7550
NoConn ~ 5650 7350
NoConn ~ 5650 7950
NoConn ~ 5650 7850
NoConn ~ 5650 7750
NoConn ~ 5650 7650
NoConn ~ 5650 7550
Text Label 3750 7750 0    50   ~ 0
PA9
Text Label 3750 7850 0    50   ~ 0
PA10
Text Label 3750 6850 0    50   ~ 0
PA0
Text Label 3750 7050 0    50   ~ 0
PA2
Text Label 3750 7150 0    50   ~ 0
PA3
Wire Wire Line
	3750 8350 4400 8350
Wire Wire Line
	4400 8350 4400 7850
Wire Wire Line
	4400 7850 4650 7850
Text Label 3750 7250 0    50   ~ 0
RFM_D0
Text Label 5650 7450 0    50   ~ 0
RFM_D0
Wire Wire Line
	3750 7650 4650 7650
Text Label 4050 8350 0    50   ~ 0
RFM_RST
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5D9801FF
P 2600 1800
F 0 "JP1" H 2600 2004 50  0000 C CNN
F 1 "VSIG_Select" H 2600 1913 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2600 1800 50  0001 C CNN
F 3 "~" H 2600 1800 50  0001 C CNN
	1    2600 1800
	1    0    0    -1  
$EndComp
Text Label 2350 1800 2    50   ~ 0
3V3
Text Label 2850 1800 0    50   ~ 0
5V
Text Label 2600 1950 3    50   ~ 0
VSIG
Text Label 2450 3350 2    50   ~ 0
5V
Text Label 2450 3550 2    50   ~ 0
5V
Text Label 2950 3850 0    50   ~ 0
5V
Text Label 2950 3950 0    50   ~ 0
5V
Text Label 2950 4050 0    50   ~ 0
5V
Wire Wire Line
	2600 1950 2600 2100
$Comp
L Connector:Conn_01x04_Male J13
U 1 1 5DAD7119
P 2500 9250
F 0 "J13" H 2600 9600 50  0000 C CNN
F 1 "Prog" H 2600 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm" H 2500 9250 50  0001 C CNN
F 3 "~" H 2500 9250 50  0001 C CNN
	1    2500 9250
	1    0    0    -1  
$EndComp
Text Label 2700 9150 0    50   ~ 0
3V3SB
Text Label 2700 9250 0    50   ~ 0
SWD
Text Label 2700 9350 0    50   ~ 0
SWC
Text Label 2700 9450 0    50   ~ 0
GND
Text Label 1400 8300 0    50   ~ 0
PA0
Text Label 1400 8600 0    50   ~ 0
PA2
Text Label 1400 8500 0    50   ~ 0
PA3
Text Label 1400 8800 0    50   ~ 0
SCK
Text Label 1400 8700 0    50   ~ 0
MISO
Text Label 1400 9000 0    50   ~ 0
MOSI
Text Label 1400 8200 0    50   ~ 0
PA9
Text Label 1400 8000 0    50   ~ 0
PA10
Text Label 1400 8900 0    50   ~ 0
RST
Text Label 1400 9100 0    50   ~ 0
GND
Text Label 1400 7900 0    50   ~ 0
3V3SB
$Comp
L Connector:Conn_01x14_Male J12
U 1 1 5DBAA976
P 1200 8500
F 0 "J12" H 1300 9350 50  0000 C CNN
F 1 "Header" H 1300 9250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x07_Pitch2.54mm" H 1200 8500 50  0001 C CNN
F 3 "~" H 1200 8500 50  0001 C CNN
	1    1200 8500
	1    0    0    -1  
$EndComp
Text Label 2550 6550 2    50   ~ 0
C14
Text Label 2550 6650 2    50   ~ 0
C15
Text Label 1400 8100 0    50   ~ 0
C14
Text Label 1400 8400 0    50   ~ 0
C15
Text Label 6950 5200 2    50   ~ 0
OUT2_D2
Text Label 3550 1800 2    50   ~ 0
VSIG
$Comp
L power:GND #PWR0102
U 1 1 5DB262FA
P 5500 2000
F 0 "#PWR0102" H 5500 1750 50  0001 C CNN
F 1 "GND" H 5505 1827 50  0000 C CNN
F 2 "" H 5500 2000 50  0001 C CNN
F 3 "" H 5500 2000 50  0001 C CNN
	1    5500 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5DB343D5
P 3750 1900
F 0 "C1" H 3700 2200 50  0000 L CNN
F 1 "22uF" H 3650 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 3750 1900 50  0001 C CNN
F 3 "~" H 3750 1900 50  0001 C CNN
	1    3750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5DB3AD20
P 4000 1900
F 0 "C3" H 3950 2200 50  0000 L CNN
F 1 "22uF" H 3900 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4000 1900 50  0001 C CNN
F 3 "~" H 4000 1900 50  0001 C CNN
	1    4000 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5DB3B04C
P 4250 1900
F 0 "C4" H 4200 2200 50  0000 L CNN
F 1 "22uF" H 4150 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4250 1900 50  0001 C CNN
F 3 "~" H 4250 1900 50  0001 C CNN
	1    4250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5DB3B4F2
P 4500 1900
F 0 "C10" H 4450 2200 50  0000 L CNN
F 1 "22uF" H 4400 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4500 1900 50  0001 C CNN
F 3 "~" H 4500 1900 50  0001 C CNN
	1    4500 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5DB3B7DE
P 4750 1900
F 0 "C12" H 4700 2200 50  0000 L CNN
F 1 "22uF" H 4650 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4750 1900 50  0001 C CNN
F 3 "~" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5DB3BAE6
P 5000 1900
F 0 "C14" H 4950 2200 50  0000 L CNN
F 1 "22uF" H 4900 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5000 1900 50  0001 C CNN
F 3 "~" H 5000 1900 50  0001 C CNN
	1    5000 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5DB3BCA7
P 5250 1900
F 0 "C18" H 5200 2200 50  0000 L CNN
F 1 "22uF" H 5150 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5250 1900 50  0001 C CNN
F 3 "~" H 5250 1900 50  0001 C CNN
	1    5250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5DB3BF4E
P 5500 1900
F 0 "C19" H 5450 2200 50  0000 L CNN
F 1 "22uF" H 5400 2100 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5500 1900 50  0001 C CNN
F 3 "~" H 5500 1900 50  0001 C CNN
	1    5500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1800 4000 1800
Connection ~ 4000 1800
Wire Wire Line
	4000 1800 4250 1800
Connection ~ 4250 1800
Wire Wire Line
	4250 1800 4500 1800
Connection ~ 4500 1800
Wire Wire Line
	4500 1800 4750 1800
Connection ~ 4750 1800
Wire Wire Line
	4750 1800 5000 1800
Connection ~ 5000 1800
Wire Wire Line
	5000 1800 5250 1800
Connection ~ 5250 1800
Wire Wire Line
	5250 1800 5500 1800
Wire Wire Line
	5500 2000 5250 2000
Connection ~ 5500 2000
Connection ~ 4000 2000
Wire Wire Line
	4000 2000 3750 2000
Connection ~ 4250 2000
Wire Wire Line
	4250 2000 4000 2000
Connection ~ 4500 2000
Wire Wire Line
	4500 2000 4250 2000
Connection ~ 4750 2000
Wire Wire Line
	4750 2000 4500 2000
Connection ~ 5000 2000
Wire Wire Line
	5000 2000 4750 2000
Connection ~ 5250 2000
Wire Wire Line
	5250 2000 5000 2000
Text Label 6950 3650 2    50   ~ 0
GND
Text Label 6950 5400 2    50   ~ 0
GND
Text Label 6950 10300 2    50   ~ 0
GND
Text Label 8000 3650 0    50   ~ 0
VSIG
Text Label 6950 4850 2    50   ~ 0
OUT_OE
Text Label 6950 4650 2    50   ~ 0
OUT_A0
Text Label 6950 4300 2    50   ~ 0
OUT_CLK
Text Label 6950 4100 2    50   ~ 0
OUT_A1
Text Label 6950 3750 2    50   ~ 0
OUT_LE
Text Label 6950 9750 2    50   ~ 0
OUT_OE
Text Label 6950 9550 2    50   ~ 0
OUT_A0
Text Label 6950 9200 2    50   ~ 0
OUT_CLK
Text Label 6950 9000 2    50   ~ 0
OUT_A1
Text Label 6950 8650 2    50   ~ 0
OUT_LE
$Comp
L 74xGxx:74LVC2G17GW_Compact U6
U 1 1 5DBFE0D9
P 7500 3650
F 0 "U6" V 7450 3650 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 3400 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 3550 50  0001 C CNN
F 3 "" H 7500 3550 50  0001 C CNN
	1    7500 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U7
U 1 1 5DBFE0E3
P 7500 4200
F 0 "U7" V 7450 4200 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 3950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 4100 50  0001 C CNN
F 3 "" H 7500 4100 50  0001 C CNN
	1    7500 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U8
U 1 1 5DBFE0ED
P 7500 4750
F 0 "U8" V 7450 4750 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 4500 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 4650 50  0001 C CNN
F 3 "" H 7500 4650 50  0001 C CNN
	1    7500 4750
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U11
U 1 1 5DBFE0F7
P 7500 5300
F 0 "U11" V 7450 5300 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 5050 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 5200 50  0001 C CNN
F 3 "" H 7500 5200 50  0001 C CNN
	1    7500 5300
	1    0    0    -1  
$EndComp
NoConn ~ 8000 5400
Wire Wire Line
	8000 3550 8350 3550
Wire Wire Line
	8350 3550 8350 4150
Wire Wire Line
	8350 4150 8550 4150
Wire Wire Line
	8000 3750 8300 3750
Wire Wire Line
	8300 3750 8300 4250
Wire Wire Line
	8300 4250 8550 4250
Wire Wire Line
	8000 4100 8250 4100
Wire Wire Line
	8250 4350 8550 4350
Wire Wire Line
	8250 4100 8250 4350
Text Label 8000 4200 0    50   ~ 0
VSIG
Wire Wire Line
	8000 4300 8200 4300
Wire Wire Line
	8200 4300 8200 4450
Wire Wire Line
	8200 4450 8550 4450
Wire Wire Line
	8000 4650 8250 4650
Wire Wire Line
	8250 4650 8250 4550
Wire Wire Line
	8250 4550 8550 4550
Wire Wire Line
	8000 4850 8300 4850
Wire Wire Line
	8300 4850 8300 4650
Wire Wire Line
	8300 4650 8550 4650
Wire Wire Line
	8000 5200 8350 5200
Wire Wire Line
	8350 5200 8350 4750
Wire Wire Line
	8350 4750 8550 4750
Text Label 8000 4750 0    50   ~ 0
VSIG
Text Label 8000 5300 0    50   ~ 0
VSIG
Text Label 6950 4200 2    50   ~ 0
GND
Text Label 6950 4750 2    50   ~ 0
GND
Text Label 6950 5300 2    50   ~ 0
GND
Text Label 8000 8550 0    50   ~ 0
VSIG
$Comp
L 74xGxx:74LVC2G17GW_Compact U16
U 1 1 5DBFE11E
P 7500 8550
F 0 "U16" V 7450 8550 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 8300 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 8450 50  0001 C CNN
F 3 "" H 7500 8450 50  0001 C CNN
	1    7500 8550
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U17
U 1 1 5DBFE128
P 7500 9100
F 0 "U17" V 7450 9100 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 8850 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 9000 50  0001 C CNN
F 3 "" H 7500 9000 50  0001 C CNN
	1    7500 9100
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U18
U 1 1 5DBFE132
P 7500 9650
F 0 "U18" V 7450 9650 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 9400 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 9550 50  0001 C CNN
F 3 "" H 7500 9550 50  0001 C CNN
	1    7500 9650
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U19
U 1 1 5DBFE13C
P 7500 10200
F 0 "U19" V 7450 10200 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 9950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 10100 50  0001 C CNN
F 3 "" H 7500 10100 50  0001 C CNN
	1    7500 10200
	1    0    0    -1  
$EndComp
NoConn ~ 8000 10300
Wire Wire Line
	8000 8450 8350 8450
Wire Wire Line
	8350 8450 8350 9050
Wire Wire Line
	8350 9050 8550 9050
Wire Wire Line
	8000 8650 8300 8650
Wire Wire Line
	8300 8650 8300 9150
Wire Wire Line
	8300 9150 8550 9150
Wire Wire Line
	8000 9000 8250 9000
Wire Wire Line
	8250 9250 8550 9250
Wire Wire Line
	8250 9000 8250 9250
Text Label 8000 9100 0    50   ~ 0
VSIG
Wire Wire Line
	8000 9200 8200 9200
Wire Wire Line
	8200 9200 8200 9350
Wire Wire Line
	8200 9350 8550 9350
Wire Wire Line
	8000 9550 8250 9550
Wire Wire Line
	8250 9550 8250 9450
Wire Wire Line
	8250 9450 8550 9450
Wire Wire Line
	8000 9750 8300 9750
Wire Wire Line
	8300 9750 8300 9550
Wire Wire Line
	8300 9550 8550 9550
Wire Wire Line
	8000 10100 8350 10100
Wire Wire Line
	8350 10100 8350 9650
Wire Wire Line
	8350 9650 8550 9650
Text Label 8000 9650 0    50   ~ 0
VSIG
Text Label 8000 10200 0    50   ~ 0
VSIG
Text Label 6950 10200 2    50   ~ 0
GND
Text Label 6950 9650 2    50   ~ 0
GND
Text Label 6950 9100 2    50   ~ 0
GND
Text Label 6950 8550 2    50   ~ 0
GND
Text Label 8000 6100 0    50   ~ 0
VSIG
$Comp
L 74xGxx:74LVC2G17GW_Compact U12
U 1 1 5DBFE164
P 7500 6100
F 0 "U12" V 7450 6100 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 5850 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 6000 50  0001 C CNN
F 3 "" H 7500 6000 50  0001 C CNN
	1    7500 6100
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U13
U 1 1 5DBFE16E
P 7500 6650
F 0 "U13" V 7450 6650 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 6400 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 6550 50  0001 C CNN
F 3 "" H 7500 6550 50  0001 C CNN
	1    7500 6650
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U14
U 1 1 5DBFE178
P 7500 7200
F 0 "U14" V 7450 7200 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 6950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 7100 50  0001 C CNN
F 3 "" H 7500 7100 50  0001 C CNN
	1    7500 7200
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U15
U 1 1 5DBFE182
P 7500 7750
F 0 "U15" V 7450 7750 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 7500 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 7650 50  0001 C CNN
F 3 "" H 7500 7650 50  0001 C CNN
	1    7500 7750
	1    0    0    -1  
$EndComp
NoConn ~ 8000 7850
Wire Wire Line
	8000 6000 8350 6000
Wire Wire Line
	8350 6000 8350 6600
Wire Wire Line
	8350 6600 8550 6600
Wire Wire Line
	8000 6200 8300 6200
Wire Wire Line
	8300 6200 8300 6700
Wire Wire Line
	8300 6700 8550 6700
Wire Wire Line
	8000 6550 8250 6550
Wire Wire Line
	8250 6800 8550 6800
Wire Wire Line
	8250 6550 8250 6800
Text Label 8000 6650 0    50   ~ 0
VSIG
Wire Wire Line
	8000 6750 8200 6750
Wire Wire Line
	8200 6750 8200 6900
Wire Wire Line
	8200 6900 8550 6900
Wire Wire Line
	8000 7100 8250 7100
Wire Wire Line
	8250 7100 8250 7000
Wire Wire Line
	8250 7000 8550 7000
Wire Wire Line
	8000 7300 8300 7300
Wire Wire Line
	8300 7300 8300 7100
Wire Wire Line
	8300 7100 8550 7100
Wire Wire Line
	8000 7650 8350 7650
Wire Wire Line
	8350 7650 8350 7200
Wire Wire Line
	8350 7200 8550 7200
Text Label 8000 7200 0    50   ~ 0
VSIG
Text Label 8000 7750 0    50   ~ 0
VSIG
Text Label 6950 6100 2    50   ~ 0
GND
Text Label 6950 7850 2    50   ~ 0
GND
Text Label 6950 7300 2    50   ~ 0
OUT_OE
Text Label 6950 7100 2    50   ~ 0
OUT_A0
Text Label 6950 6750 2    50   ~ 0
OUT_CLK
Text Label 6950 6550 2    50   ~ 0
OUT_A1
Text Label 6950 6200 2    50   ~ 0
OUT_LE
Text Label 6950 6650 2    50   ~ 0
GND
Text Label 6950 7200 2    50   ~ 0
GND
Text Label 6950 7750 2    50   ~ 0
GND
Text Label 6950 1200 2    50   ~ 0
GND
Text Label 6950 2950 2    50   ~ 0
GND
Text Label 8000 1200 0    50   ~ 0
VSIG
Text Label 6950 2400 2    50   ~ 0
OUT_OE
Text Label 6950 2200 2    50   ~ 0
OUT_A0
Text Label 6950 1850 2    50   ~ 0
OUT_CLK
Text Label 6950 1650 2    50   ~ 0
OUT_A1
Text Label 6950 1300 2    50   ~ 0
OUT_LE
$Comp
L 74xGxx:74LVC2G17GW_Compact U2
U 1 1 5DBFE1B7
P 7500 1200
F 0 "U2" V 7450 1200 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 1100 50  0001 C CNN
F 3 "" H 7500 1100 50  0001 C CNN
	1    7500 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U3
U 1 1 5DBFE1C1
P 7500 1750
F 0 "U3" V 7450 1750 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 1500 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 1650 50  0001 C CNN
F 3 "" H 7500 1650 50  0001 C CNN
	1    7500 1750
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U4
U 1 1 5DBFE1CB
P 7500 2300
F 0 "U4" V 7450 2300 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 2050 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 2200 50  0001 C CNN
F 3 "" H 7500 2200 50  0001 C CNN
	1    7500 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U5
U 1 1 5DBFE1D5
P 7500 2850
F 0 "U5" V 7450 2850 50  0000 C CNN
F 1 "74LVC2G17GW" H 7500 2600 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 7500 2750 50  0001 C CNN
F 3 "" H 7500 2750 50  0001 C CNN
	1    7500 2850
	1    0    0    -1  
$EndComp
NoConn ~ 8000 2950
Wire Wire Line
	8000 1100 8350 1100
Wire Wire Line
	8350 1100 8350 1700
Wire Wire Line
	8000 1300 8300 1300
Wire Wire Line
	8300 1300 8300 1800
Wire Wire Line
	8000 1650 8250 1650
Wire Wire Line
	8250 1650 8250 1900
Text Label 8000 1750 0    50   ~ 0
VSIG
Wire Wire Line
	8000 1850 8200 1850
Wire Wire Line
	8200 1850 8200 2000
Wire Wire Line
	8000 2200 8250 2200
Wire Wire Line
	8250 2200 8250 2100
Wire Wire Line
	8000 2400 8300 2400
Wire Wire Line
	8300 2400 8300 2200
Wire Wire Line
	8000 2750 8350 2750
Wire Wire Line
	8350 2750 8350 2300
Text Label 8000 2300 0    50   ~ 0
VSIG
Text Label 8000 2850 0    50   ~ 0
VSIG
Text Label 6950 1750 2    50   ~ 0
GND
Text Label 6950 2300 2    50   ~ 0
GND
Text Label 6950 2850 2    50   ~ 0
GND
Wire Wire Line
	8800 1700 8350 1700
Wire Wire Line
	8300 1800 8800 1800
Wire Wire Line
	8250 1900 8800 1900
Wire Wire Line
	8200 2000 8800 2000
Wire Wire Line
	8250 2100 8800 2100
Wire Wire Line
	8800 2200 8300 2200
Wire Wire Line
	8350 2300 8800 2300
Text Label 2450 3850 2    50   ~ 0
5VSB
$Comp
L Regulator_Linear:MCP1700-3302E_SOT23 U1
U 1 1 5DE9E110
P 4600 5050
F 0 "U1" H 4600 5292 50  0000 C CNN
F 1 "MCP1700-3302E" H 4600 5201 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4600 5275 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001826D.pdf" H 4600 5050 50  0001 C CNN
	1    4600 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DE9F837
P 4600 5350
F 0 "#PWR0103" H 4600 5100 50  0001 C CNN
F 1 "GND" H 4605 5177 50  0000 C CNN
F 2 "" H 4600 5350 50  0001 C CNN
F 3 "" H 4600 5350 50  0001 C CNN
	1    4600 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5DE9FCEF
P 5100 5200
F 0 "C13" H 5200 5150 50  0000 L CNN
F 1 "22uF" H 5200 5250 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 5100 5200 50  0001 C CNN
F 3 "~" H 5100 5200 50  0001 C CNN
	1    5100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5050 5100 5050
Wire Wire Line
	5100 5350 4600 5350
Connection ~ 4600 5350
$Comp
L Device:C_Small C2
U 1 1 5DEBF854
P 4100 5200
F 0 "C2" H 3900 5150 50  0000 L CNN
F 1 "22uF" H 3850 5250 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4100 5200 50  0001 C CNN
F 3 "~" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5050 4100 5050
Wire Wire Line
	4100 5350 4600 5350
Wire Wire Line
	5100 5050 5100 5100
Wire Wire Line
	4100 5050 4100 5100
Text Label 4200 5050 2    50   ~ 0
5VSB
Text Label 5000 5050 0    50   ~ 0
3V3SB
Wire Wire Line
	5100 5300 5100 5350
Wire Wire Line
	4100 5300 4100 5350
Text Label 3750 8050 0    50   ~ 0
SW_ON
$Comp
L Switch:SW_Push SW1
U 1 1 5DFA0ADA
P 4200 9350
F 0 "SW1" H 4200 9635 50  0000 C CNN
F 1 "SW_Push" H 4200 9544 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVQQ2" H 4200 9550 50  0001 C CNN
F 3 "~" H 4200 9550 50  0001 C CNN
	1    4200 9350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5DFA173D
P 4750 9250
F 0 "C11" H 4850 9300 50  0000 L CNN
F 1 "1uF" H 4850 9200 50  0000 L CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4750 9250 50  0001 C CNN
F 3 "~" H 4750 9250 50  0001 C CNN
	1    4750 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 9350 4750 9350
Text Label 4750 9150 0    50   ~ 0
3V3SB
$Comp
L Device:R_Small R1
U 1 1 5DFB41AE
P 4500 9350
F 0 "R1" V 4696 9350 50  0000 C CNN
F 1 "1K" V 4605 9350 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4500 9350 50  0001 C CNN
F 3 "~" H 4500 9350 50  0001 C CNN
	1    4500 9350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DFB51AE
P 4000 9350
F 0 "#PWR0104" H 4000 9100 50  0001 C CNN
F 1 "GND" H 4005 9177 50  0000 C CNN
F 2 "" H 4000 9350 50  0001 C CNN
F 3 "" H 4000 9350 50  0001 C CNN
	1    4000 9350
	1    0    0    -1  
$EndComp
Text Label 5100 9350 0    50   ~ 0
SW_ON
Wire Wire Line
	4750 9350 5100 9350
Connection ~ 4750 9350
Text Label 1400 9200 0    50   ~ 0
GND
$Comp
L 74xGxx:74LVC2G17GW_Compact U32
U 1 1 5E29D2A4
P 10250 8600
F 0 "U32" V 10200 8600 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 8350 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 8500 50  0001 C CNN
F 3 "" H 10250 8500 50  0001 C CNN
	1    10250 8600
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U33
U 1 1 5E29D2AE
P 10250 9150
F 0 "U33" V 10200 9150 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 8900 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 9050 50  0001 C CNN
F 3 "" H 10250 9050 50  0001 C CNN
	1    10250 9150
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U34
U 1 1 5E29D2B8
P 10250 9700
F 0 "U34" V 10200 9700 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 9450 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 9600 50  0001 C CNN
F 3 "" H 10250 9600 50  0001 C CNN
	1    10250 9700
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U35
U 1 1 5E29D2C2
P 10250 10250
F 0 "U35" V 10200 10250 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 10000 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 10150 50  0001 C CNN
F 3 "" H 10250 10150 50  0001 C CNN
	1    10250 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1800 3550 1800
Connection ~ 3750 1800
Text Label 9700 5250 2    50   ~ 0
OUT6_D2
Text Label 9700 1200 2    50   ~ 0
GND
Text Label 9700 2950 2    50   ~ 0
GND
Text Label 10750 1200 0    50   ~ 0
VSIG
Text Label 9700 2400 2    50   ~ 0
OUT_OE
Text Label 9700 2200 2    50   ~ 0
OUT_A0
Text Label 9700 1850 2    50   ~ 0
OUT_CLK
Text Label 9700 1650 2    50   ~ 0
OUT_A1
Text Label 9700 1300 2    50   ~ 0
OUT_LE
$Comp
L 74xGxx:74LVC2G17GW_Compact U28
U 1 1 5E37FFCD
P 10250 1200
F 0 "U28" V 10200 1200 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 1100 50  0001 C CNN
F 3 "" H 10250 1100 50  0001 C CNN
	1    10250 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U29
U 1 1 5E37FFD7
P 10250 1750
F 0 "U29" V 10200 1750 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 1500 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 1650 50  0001 C CNN
F 3 "" H 10250 1650 50  0001 C CNN
	1    10250 1750
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U30
U 1 1 5E37FFE1
P 10250 2300
F 0 "U30" V 10200 2300 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 2050 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 2200 50  0001 C CNN
F 3 "" H 10250 2200 50  0001 C CNN
	1    10250 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U31
U 1 1 5E37FFEB
P 10250 2850
F 0 "U31" V 10200 2850 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 2600 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 2750 50  0001 C CNN
F 3 "" H 10250 2750 50  0001 C CNN
	1    10250 2850
	1    0    0    -1  
$EndComp
NoConn ~ 10750 2950
Wire Wire Line
	10750 1100 11100 1100
Wire Wire Line
	11100 1100 11100 1700
Wire Wire Line
	10750 1300 11050 1300
Wire Wire Line
	11050 1300 11050 1800
Wire Wire Line
	10750 1650 11000 1650
Wire Wire Line
	11000 1650 11000 1900
Text Label 10750 1750 0    50   ~ 0
VSIG
Wire Wire Line
	10750 1850 10950 1850
Wire Wire Line
	10950 1850 10950 2000
Wire Wire Line
	10750 2200 11000 2200
Wire Wire Line
	11000 2200 11000 2100
Wire Wire Line
	10750 2400 11050 2400
Wire Wire Line
	11050 2400 11050 2200
Wire Wire Line
	10750 2750 11100 2750
Wire Wire Line
	11100 2750 11100 2300
Text Label 10750 2300 0    50   ~ 0
VSIG
Text Label 10750 2850 0    50   ~ 0
VSIG
Text Label 9700 1750 2    50   ~ 0
GND
Text Label 9700 2300 2    50   ~ 0
GND
Text Label 9700 2850 2    50   ~ 0
GND
Wire Wire Line
	11550 1700 11100 1700
Wire Wire Line
	11050 1800 11550 1800
Wire Wire Line
	11000 1900 11550 1900
Wire Wire Line
	10950 2000 11550 2000
Wire Wire Line
	11000 2100 11550 2100
Wire Wire Line
	11550 2200 11050 2200
Wire Wire Line
	11100 2300 11550 2300
Text Label 10750 6150 0    50   ~ 0
VSIG
$Comp
L 74xGxx:74LVC2G17GW_Compact U20
U 1 1 5E39C42F
P 10250 6150
F 0 "U20" V 10200 6150 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 5900 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 6050 50  0001 C CNN
F 3 "" H 10250 6050 50  0001 C CNN
	1    10250 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U21
U 1 1 5E39C439
P 10250 6700
F 0 "U21" V 10200 6700 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 6450 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 6600 50  0001 C CNN
F 3 "" H 10250 6600 50  0001 C CNN
	1    10250 6700
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U22
U 1 1 5E39C443
P 10250 7250
F 0 "U22" V 10200 7250 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 7000 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 7150 50  0001 C CNN
F 3 "" H 10250 7150 50  0001 C CNN
	1    10250 7250
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U23
U 1 1 5E39C44D
P 10250 7800
F 0 "U23" V 10200 7800 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 7550 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 7700 50  0001 C CNN
F 3 "" H 10250 7700 50  0001 C CNN
	1    10250 7800
	1    0    0    -1  
$EndComp
NoConn ~ 10750 7900
Wire Wire Line
	10750 6050 11100 6050
Wire Wire Line
	11100 6050 11100 6650
Wire Wire Line
	11100 6650 11300 6650
Wire Wire Line
	10750 6250 11050 6250
Wire Wire Line
	11050 6250 11050 6750
Wire Wire Line
	11050 6750 11300 6750
Wire Wire Line
	10750 6600 11000 6600
Wire Wire Line
	11000 6850 11300 6850
Wire Wire Line
	11000 6600 11000 6850
Text Label 10750 6700 0    50   ~ 0
VSIG
Wire Wire Line
	10750 6800 10950 6800
Wire Wire Line
	10950 6800 10950 6950
Wire Wire Line
	10950 6950 11300 6950
Wire Wire Line
	10750 7150 11000 7150
Wire Wire Line
	11000 7150 11000 7050
Wire Wire Line
	11000 7050 11300 7050
Wire Wire Line
	10750 7350 11050 7350
Wire Wire Line
	11050 7350 11050 7150
Wire Wire Line
	11050 7150 11300 7150
Wire Wire Line
	10750 7700 11100 7700
Wire Wire Line
	11100 7700 11100 7250
Wire Wire Line
	11100 7250 11300 7250
Text Label 10750 7250 0    50   ~ 0
VSIG
Text Label 10750 7800 0    50   ~ 0
VSIG
Text Label 9700 6150 2    50   ~ 0
GND
Text Label 9700 7900 2    50   ~ 0
GND
Text Label 9700 7350 2    50   ~ 0
OUT_OE
Text Label 9700 7150 2    50   ~ 0
OUT_A0
Text Label 9700 6800 2    50   ~ 0
OUT_CLK
Text Label 9700 6600 2    50   ~ 0
OUT_A1
Text Label 9700 6250 2    50   ~ 0
OUT_LE
Text Label 9700 6700 2    50   ~ 0
GND
Text Label 9700 7250 2    50   ~ 0
GND
Text Label 9700 7800 2    50   ~ 0
GND
Text Label 9700 3700 2    50   ~ 0
GND
Text Label 9700 5450 2    50   ~ 0
GND
Text Label 10750 3700 0    50   ~ 0
VSIG
Text Label 9700 4900 2    50   ~ 0
OUT_OE
Text Label 9700 4700 2    50   ~ 0
OUT_A0
Text Label 9700 4350 2    50   ~ 0
OUT_CLK
Text Label 9700 4150 2    50   ~ 0
OUT_A1
Text Label 9700 3800 2    50   ~ 0
OUT_LE
$Comp
L 74xGxx:74LVC2G17GW_Compact U24
U 1 1 5E40413C
P 10250 3700
F 0 "U24" V 10200 3700 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 3450 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 3600 50  0001 C CNN
F 3 "" H 10250 3600 50  0001 C CNN
	1    10250 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U25
U 1 1 5E404146
P 10250 4250
F 0 "U25" V 10200 4250 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 4000 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 4150 50  0001 C CNN
F 3 "" H 10250 4150 50  0001 C CNN
	1    10250 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U26
U 1 1 5E404150
P 10250 4800
F 0 "U26" V 10200 4800 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 4550 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 4700 50  0001 C CNN
F 3 "" H 10250 4700 50  0001 C CNN
	1    10250 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G17GW_Compact U27
U 1 1 5E40415A
P 10250 5350
F 0 "U27" V 10200 5350 50  0000 C CNN
F 1 "74LVC2G17GW" H 10250 5100 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6" H 10250 5250 50  0001 C CNN
F 3 "" H 10250 5250 50  0001 C CNN
	1    10250 5350
	1    0    0    -1  
$EndComp
NoConn ~ 10750 5450
Wire Wire Line
	10750 3600 11100 3600
Wire Wire Line
	11100 3600 11100 4200
Wire Wire Line
	10750 3800 11050 3800
Wire Wire Line
	11050 3800 11050 4300
Wire Wire Line
	10750 4150 11000 4150
Wire Wire Line
	11000 4150 11000 4400
Text Label 10750 4250 0    50   ~ 0
VSIG
Wire Wire Line
	10750 4350 10950 4350
Wire Wire Line
	10950 4350 10950 4500
Wire Wire Line
	10750 4700 11000 4700
Wire Wire Line
	11000 4700 11000 4600
Wire Wire Line
	10750 4900 11050 4900
Wire Wire Line
	11050 4900 11050 4700
Wire Wire Line
	10750 5250 11100 5250
Wire Wire Line
	11100 5250 11100 4800
Text Label 10750 4800 0    50   ~ 0
VSIG
Text Label 10750 5350 0    50   ~ 0
VSIG
Text Label 9700 4250 2    50   ~ 0
GND
Text Label 9700 4800 2    50   ~ 0
GND
Text Label 9700 5350 2    50   ~ 0
GND
Wire Wire Line
	11550 4200 11100 4200
Wire Wire Line
	11050 4300 11550 4300
Wire Wire Line
	11000 4400 11550 4400
Wire Wire Line
	10950 4500 11550 4500
Wire Wire Line
	11000 4600 11550 4600
Wire Wire Line
	11550 4700 11050 4700
Wire Wire Line
	11100 4800 11550 4800
Text Label 9700 8600 2    50   ~ 0
GND
Text Label 9700 10350 2    50   ~ 0
GND
Text Label 9700 9800 2    50   ~ 0
OUT_OE
Text Label 9700 9600 2    50   ~ 0
OUT_A0
Text Label 9700 9250 2    50   ~ 0
OUT_CLK
Text Label 9700 9050 2    50   ~ 0
OUT_A1
Text Label 9700 8700 2    50   ~ 0
OUT_LE
Text Label 9700 9150 2    50   ~ 0
GND
Text Label 9700 9700 2    50   ~ 0
GND
Text Label 9700 10250 2    50   ~ 0
GND
Text Label 10750 8600 0    50   ~ 0
VSIG
Wire Wire Line
	10750 8500 11100 8500
Wire Wire Line
	11100 8500 11100 9100
Wire Wire Line
	11100 9100 11300 9100
Wire Wire Line
	10750 8700 11050 8700
Wire Wire Line
	11050 8700 11050 9200
Wire Wire Line
	11050 9200 11300 9200
Wire Wire Line
	10750 9050 11000 9050
Wire Wire Line
	11000 9300 11300 9300
Wire Wire Line
	11000 9050 11000 9300
Text Label 10750 9150 0    50   ~ 0
VSIG
Wire Wire Line
	10750 9250 10950 9250
Wire Wire Line
	10950 9250 10950 9400
Wire Wire Line
	10950 9400 11300 9400
Wire Wire Line
	10750 9600 11000 9600
Wire Wire Line
	11000 9600 11000 9500
Wire Wire Line
	11000 9500 11300 9500
Wire Wire Line
	10750 9800 11050 9800
Wire Wire Line
	11050 9800 11050 9600
Wire Wire Line
	11050 9600 11300 9600
Wire Wire Line
	10750 10150 11100 10150
Wire Wire Line
	11100 10150 11100 9700
Wire Wire Line
	11100 9700 11300 9700
Text Label 10750 9700 0    50   ~ 0
VSIG
Text Label 10750 10250 0    50   ~ 0
VSIG
NoConn ~ 10750 10350
NoConn ~ 2450 4150
$Comp
L Diode:1N62xxA D1
U 1 1 5E71E544
P 5800 1900
F 0 "D1" V 5754 1979 50  0000 L CNN
F 1 "TVS(5V)" V 5845 1979 50  0000 L CNN
F 2 "UserLibrary:DO_214AC" H 5800 1700 50  0001 C CNN
F 3 "https://www.vishay.com/docs/88301/15ke.pdf" H 5750 1900 50  0001 C CNN
	1    5800 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 1800 5700 1800
Wire Wire Line
	5700 1800 5700 1750
Wire Wire Line
	5700 1750 5800 1750
Connection ~ 5500 1800
Wire Wire Line
	5800 2050 5700 2050
Wire Wire Line
	5700 2050 5700 2000
Wire Wire Line
	5700 2000 5500 2000
$Comp
L Device:R_Small R2
U 1 1 5D6BEAD6
P 4150 7950
F 0 "R2" V 4346 7950 50  0000 C CNN
F 1 "10K" V 4255 7950 50  0000 C CNN
F 2 "UserLibrary:R_0603_HandSoldering2" H 4150 7950 50  0001 C CNN
F 3 "~" H 4150 7950 50  0001 C CNN
	1    4150 7950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 7950 3750 7950
Wire Wire Line
	4250 7950 4300 7950
Text Label 4300 7700 3    50   ~ 0
3V3SB
Wire Wire Line
	4300 7700 4300 7950
Wire Notes Line
	6050 6550 6050 8450
Wire Notes Line
	6050 8450 4500 8450
Wire Notes Line
	4500 8450 4500 6550
Wire Notes Line
	4500 6550 6050 6550
Text Notes 4800 6500 0    50   ~ 0
Optional 433MHz Module
$EndSCHEMATC
