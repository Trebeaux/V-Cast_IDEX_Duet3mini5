M207 S0.5 R0.2 F1500 T1500 Z0.0 ; firmware retraction settings for Eryone Sparkle

if job.build == null
   echo "No job detected, Temp not set"
else
   M104 S210   ;turn on and set temps
   M140 S50    ;set bed to 50c 
   M116        ;wait for temps to stablize 
