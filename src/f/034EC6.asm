; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part3 - part 3 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part3:
	move.w	#$828,-$392C(a5)
	move.w	#$828,-$392A(a5)
	move.w	#$828,-$3928(a5)
	move.w	#$828,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034EE2:
	move.w	#$EEE,-$392C(a5)
	move.w	#$A2A,-$392A(a5)
	move.w	#$A2A,-$3928(a5)
	move.w	#$A2A,-$3926(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034EFC:
	move.w	#$C2C,-$392C(a5)
	move.w	#$EEE,-$392A(a5)
	move.w	#$C2C,-$3928(a5)
	move.w	#$C2C,-$3926(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F16:
	move.w	#$E4E,-$392C(a5)
	move.w	#$E4E,-$392A(a5)
	move.w	#$EEE,-$3928(a5)
	move.w	#$E4E,-$3926(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F30:
	move.w	#$C2C,-$392C(a5)
	move.w	#$C2C,-$392A(a5)
	move.w	#$C2C,-$3928(a5)
	move.w	#$EEE,-$3926(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F4A:
	move.w	#$A2A,-$392C(a5)
	move.w	#$A2A,-$392A(a5)
	move.w	#$A2A,-$3928(a5)
	move.w	#$A2A,-$3926(a5)
