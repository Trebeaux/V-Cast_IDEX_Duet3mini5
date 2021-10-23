; bed.g
; Called on G32 to tram the gantry to the bed

;Axis are in order of XYZU. So X=0, Y=1, Z=2, U=3. Delete the last move.axes if you do not have a U Axis.  
;
;Check to see if the axis are homed, if no, home them
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed || !move.axes[3].homed 
	G28									;Home Axis
	continue
else
	G30 P0 X-120 Y0 Z-99999				; Probe near the left leadscrew
	G30 P1 X110 Y0 Z-99999 S2			; Probe near the right leadscrew and calibrate
	G1 H2 Y-150 X-150 F6000				;Return bed and x to home position. 