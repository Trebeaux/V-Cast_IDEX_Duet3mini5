; pause.g
; Called upon pausing a print in DWC
;

M83						; Relative extruder positioning
G1 E-2 F1800					; Retract the extruder by 2mm
G91						; Relative positioning
G1 Z5 F6000 					; Lift Z relative to current position
G90						; Absolute positioning
G1 X-400 F6000 H1				; Move X1 to axis minima. Stop at endstop
G1 U400 F6000 H1				; Move X2 to axis maxima. Stop at endstop
