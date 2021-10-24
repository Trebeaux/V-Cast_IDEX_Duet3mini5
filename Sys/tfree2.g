; tfree2.g
; Called upon releasing tool 2
;

M106 S0					; Disable part cooling on this tool
G91								; Relative positioning
G1 Z5 F6000 H2					; Lift Z relative to current position
G1 X-999 U999 F3000 H1			; Move Y-axis to the endstop and stop (first pass)
G90								; Absolute positioning
