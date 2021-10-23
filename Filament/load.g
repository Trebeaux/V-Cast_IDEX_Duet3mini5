M291 P"Please wait while the nozzle is being heating" R"Loading Eryone Sparkle" T5 ; Display message
G10 S200 ; Set current tool temperature to 200C
M116 ; Wait for the temperatures to be reached
M291 P"Feeding filament..." R"Loading Eryone Sparkle" T5 ; Display new message
M83 ; Extruder to relative mode
G1 E10 F600 ; Feed 10mm of filament at 600mm/min
G1 E55 F3000 ; Feed 55mm of filament at 3000mm/min
G1 E20 F300 ; Feed 20mm of filament at 300mm/min
G4 P1000 ; Wait one second
G1 E-0.5 F1800 ; Retract 0.5mm of filament at 1800mm/min
M400 ; Wait for moves to complete
M292 ; Hide the message
G10 S0 ; Turn off the heater again