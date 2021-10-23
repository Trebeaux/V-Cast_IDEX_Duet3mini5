M291 P"Please wait while the nozzle is being heated up" R"Unloading Eryone Sparkle" T5 ; Display message
G10 S120 ; Heat up the current tool to 120C
M116 ; Wait for the temperatures to be reached
M291 P"Retracting filament..." R"Unloading Eryone Sparkle" T5 ; Display another message
G1 E2 F300 ;Feed filament slightly 
G1 E-20 F300 ; Retract 20mm of filament at 300mm/min
G1 E-60 F3000 ; Retract 60mm of filament at 3000mm/min
M400 ; Wait for the moves to finish
M292 ; Hide the message again
M84 E0:1 ; Turn off extruder drives 1 and 2