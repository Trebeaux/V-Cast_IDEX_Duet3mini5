; homez.g
; Called to home the Z axis

G1 U400 F6000 H1		; Make sure X2 is parked
M290 R0 S0				  ; Reset baby-stepping to 0
G91					        ; Relative positioning
G1 Z20 F6000 H2			; Lift Z relative to current position
G90					        ; Absolute positioning
G1 X0 Y0 F6000 H2		; Move to probing point (X0, Y0), including probe offset
G30					        ; Probe the bed and set Z to the probe offset
