; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part1 - part 1 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part1:
	move.w	#$828,-$392C(a5)
	move.w	#$828,-$392A(a5)
	move.w	#$828,-$3928(a5)
	move.w	#$828,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E14:
	move.w	#$A2A,-$392C(a5)
	move.w	#$A2A,-$392A(a5)
	move.w	#$A2A,-$3928(a5)
	move.w	#$A2A,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E30:
	move.w	#$C2C,-$392C(a5)
	move.w	#$C2C,-$392A(a5)
	move.w	#$C2C,-$3928(a5)
	move.w	#$C2C,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E4C:
	move.w	#$E4E,-$392C(a5)
	move.w	#$E4E,-$392A(a5)
	move.w	#$E4E,-$3928(a5)
	move.w	#$E4E,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E68:
	move.w	#$C2C,-$392C(a5)
	move.w	#$C2C,-$392A(a5)
	move.w	#$C2C,-$3928(a5)
	move.w	#$C2C,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E84:
	move.w	#$A2A,-$392C(a5)
	move.w	#$A2A,-$392A(a5)
	move.w	#$A2A,-$3928(a5)
	move.w	#$A2A,-$3926(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
