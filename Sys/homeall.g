; homeall.g
; Called to home all axes
;

; BLTouch preperation
M280 P0 S160					; Precautionary alarm release
M280 P0 S90						; Ensure the pin is raised

; Home X, Y and U simultaneously
G91								            ; Relative positioning
G1 Z5 F6000 H2					      ; Lift Z relative to current position
G1 X-999 Y-999 U999 F6000 H1	; Move Y-axis to the endstop and stop (first pass)
G1 X5 Y5 U-5 F360	H2			    ; Go back a few mm
G1 X-999 Y-999 U999 F360 H1		; Move Y-axis to the endstop once more (second pass)
G90								            ; Absolute positioning

; Home Z using the Z-Probe
M290 R0 S0					  ; Reset baby-stepping to 0
G1 X0 Y0 F6000 H2			; Move T0 to probing point (X0, Y0), including probe offset
G30							      ; Probe the bed and set Z to the probe offset

; Return X and Y to their home positions
G1 X-150.80 Y-150.00 F6000 H2
