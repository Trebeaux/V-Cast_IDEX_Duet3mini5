; Configuration file for Duet 3 Mini 5+ (firmware version 3.3) 
; executed by the firmware on start-up
;
; Created by Trebeaux for V-Cast IDEX, Last edited 10/16/2021

; General preferences
G90               ; send absolute coordinates...
M83               ; ...but relative extruder moves
M550 P"V-CAST"    ; set printer name

; Network

M552 S1           ; IP HERE
M586 P0 S1        ; Enable HTTP
M586 P1 S0        ; Disable FTP
M586 P2 S0        ; Disable Telnet

; Drives

M569 P0.0 S1                                         ; physical drive 0.0 goes forwards E0
M569 P0.1 S1                                         ; physical drive 0.1 goes forwards E1
M569 P0.2 S1                                         ; physical drive 0.2 goes Forwards  X1
M569 P0.3 S1                                         ; physical drive 0.3 goes forwards X2 (U)
M569 P0.4 S1                                         ; physical drive 0.4 goes forwards Y
M569 P0.5 S1                                         ; physical drive 0.5 goes forwards Z
M569 P0.6 S1                                         ; physical drive 0.6 goes forwards Z
M584 X0.2 Y0.4 Z0.5:0.6 U0.3 E0.0:0.1                ; set drive mapping

M350 X16 Y16 Z16 U16 E16 I1                   ; configure microstepping with interpolation
M92 X160 Y160 Z800 U160 E679:679              ; set steps per mm
M203 X12000 Y12000 Z6000 U12000 E5600:5600    ; set maximum speeds (mm/min)
M201 X700 Y400 Z100 U700 E600:600             ; set accelerations (mm/s^2)
M566 X540 Y360 Z60 U540 E300:300              ; set maximum instantaneous speed changes (mm/min)
M906 X1000 Y1000 Z800 U1000 E730:730 I50      ; set motor currents (mA) and motor idle factor in per cent
M84 E0.0:0.1 X0.2 Y0.4 U0.3 S30               ; Set idle timeout

; Axis Limits
;Origin Center on V-Cast "Wideboy" Frame 
M208 S1 X-200 Y-165 U-165             ; set axis lower limits
M208 S0 X165 Y165 U200 Z380           ; set axis upper limits

; Endstops
                              
M574 X1 S1 P"io6.in"            ; active-high endstop for low end on X via pin io6.in                             
M574 Y1 S1 P"io3.in"            ; active-high endstop for low end on Y via pin io3.in
M574 U2 S1 P"io5.in"            ; active-high endstop for high end on U (X2) via pin io5.in                            

; Z-Probe BLTouch and Z axis leveling

M950 S0 C"io1.out"                           		; create servo pin 0 for BLTouch on io1.out
M558 P9 C"^io1.in" H5 F240 T24000 A5         		; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-28 Y-13 Z2.50               			    ; set Z probe trigger value, offset and trigger height
M557 X-110:110 Y-110:130 P5                     ; define mesh grid
M671 X-190:190 Y00.0:00.0 S3                    ;set z axis location

; Heaters

;Bed Heater using Keenovo 750w 120v Heater 
M308 S0 P"temp0" Y"thermistor" A"Bed" T100000 B3950   ; configure sensor 0 as thermistor on pin temp1
M950 H0 C"out0" T0        ; create bed heater output on out0 and map it to sensor 0
M140 H0                   ; map heated bed to heater 0
M143 H0 S120              ; Set temperature limit for heater 0 to 120C
M307 H0 S1.00 B0          ; Set Heater 0 to use PID and max PWM of 100%

;Heater 0 using stock e3d V6
M308 S1 P"temp1" Y"thermistor" A"Extruder" T100000 B4450 C7.06e-8   ; configure sensor 1 as thermistor on pin temp1 
M950 H1 C"out1" T1        ; create nozzle heater output on out1 and map it to sensor 1
M143 H1 S290              ; set temperature limit for heater 1 to 290C
M307 H1 B0 R2.095 C290.0:179.0 D6.75 S1.00      ; Set Heater 1 to use PID and max PWM of 100%

;Heater 1 using stock e3d V6
M308 S2 P"temp2" Y"thermistor" A"Extruder2" T100000 B4450 C7.06e-8    ; configure sensor 2 as thermistor on pin temp2
M950 H2 C"out2" T2        ; create nozzle heater output on out2 and map it to sensor 2
M143 H2 S290              ; set temperature limit for heater 2 to 290C
M307 H2 B0 R2.095 C290.0:179.0 D6.75 S1.00      ; Set Heater 2 to use PID and max PWM of 100%




; Fans
;Hotend 0
M950 F0 C"out5" Q500                               ; create fan 0 on pin out5 and set its frequency
M106 P0 S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"out3" Q500                               ; create fan 1 on pin out3 and set its frequency
M106 P1 S1 H1 T45                                  ; set fan 1 value. Thermostatic control is turned on for Heater 1 

;Hotend 1 
M950 F2 C"out6" Q500                               ; create fan 2 on pin out6 and set its frequency
M106 P2 S0 H-1 		                           	     ; set fan 2 value. Thermostatic control is turned on
M950 F3 C"out4" Q500                               ; create fan 3 on pin out4 and set its frequency
M106 P3 S1 H2 T45                                  ; set fan 3 value. Thermostatic control is turned on for Heater 2

; Tools
M563 P0 D0 H1 X0 F0 S"X"      ; Tool0 uses Extruder0, Heater1 and Fan0
G10 P0 X0 Y0 Z0 R0 S0         ; Set Tool0 axis offsets and temperatures

M563 P1 D1 H2 X3 F2 S"U"          ; Tool1 uses Extruder1, Heater2 and Fan2. X-axis is mapped to U
G10 P1 U-0.4 Y-0.3 Z-0.4 R0 S0    ; Set Tool1 axis offsets and temperatures

; ''' Create a tool that prints 2 copies of the object using both carriages'''
M563 P2 D0:1 H1:2 X0:3 F0:2 S"copy"   ; tool 2 uses both extruders, hot end heaters and fans, and maps X to both X and U
G10 P2 X0 Y0 U-150 S0 R0              ; set tool offsets and temperatures 
M567 P2 E1:1                          ; set mix ratio 100% on both extruders

M563 P3 D0:1 H1:2 X0:3 F0:2 S"mirror"   ; tool 2 uses both extruders, hot end heaters and fans, and maps X to both X and U
G10 P3 X0 Y0 U-150 S0 R0                ; set tool offsets and temperatures TO CONFIG
M567 P3 E1:1                            ; set mix ratio 100% on both extruders

;Filament Stuff
M572 D0:1 S0.075:0.075    ; Set Pressure advance
M404 N1.75                ; Define filament diameter for print monitor


; Miscellaneous - Power Down! RECOVERY
M911 S23 R24 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"  ; set voltage thresholds and actions to run on power loss

;Power supply
M81						;Keep PSU off upon boot

;Led Display
;M575 P1 S1 B57600				;Uncomment to enable a display


M308 S20 Y"mcu-temp" A"CPU"       ; CPU temp sensor (NOT ACCURATE FOR Mini 5+)
M308 S21 Y"drivers" A"Duet_drv"   ; drivers temp sensor
M308 S4 Y"drivers" A"TMC Drivers" ; Define Sensor4 as the TMC overheat sensor

;M593 F58.80 						 ; cancel ringing at 58.8Hz


T0							; Activate T0 by default		



