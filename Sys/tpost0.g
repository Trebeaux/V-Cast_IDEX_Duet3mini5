; tpost0.g
; Called after activating tool 0
;

M106 R2						; Restore part cooling on this tool
M116 P0						; Wait for this tool to reach printing temperature
;M703						; Call Filament config.g
