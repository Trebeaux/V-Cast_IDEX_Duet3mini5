; tpost3.g
; Called after activating tool 3

M106 R2     	; restore print cooling fan speed
M116 P2 			; wait for tool 2 heaters to reach operating temperature
M83 					; relative extruder movement
M579 U-1      ; Reverse U Axis direction
M567 P2 E1:1 	; set tool mix ratio
M568 P2 S1 		; turn on mixing
;M703					; Call Filament config.g
