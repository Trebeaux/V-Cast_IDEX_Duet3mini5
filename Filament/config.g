;This style of config.g allows temperature settings to be independent from the slicer as long as your slicer start gcode has an M703 at the beginning.
;If you do not want temperature settings to be controlled, then just delete everything after line 7. 

M207 S0.5 R0.2 F1500 T1500 Z0.0 ; firmware retraction settings for PLA

if job.build == null       ;Check if there is an active print loaded. 
   echo "No job detected, Temps not set"
else
   M104 S210   ;turn on and set Hotend Temp
   M140 S50    ;set bed to 50c 
   M116        ;wait for temps to stablize 
