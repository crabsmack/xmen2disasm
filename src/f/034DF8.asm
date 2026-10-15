; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part1 - part 1 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part1:
	move.w	#$828,g_PalBase+$54(a5)
	move.w	#$828,g_PalBase+$56(a5)
	move.w	#$828,g_PalBase+$58(a5)
	move.w	#$828,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E14:
	move.w	#$A2A,g_PalBase+$54(a5)
	move.w	#$A2A,g_PalBase+$56(a5)
	move.w	#$A2A,g_PalBase+$58(a5)
	move.w	#$A2A,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E30:
	move.w	#$C2C,g_PalBase+$54(a5)
	move.w	#$C2C,g_PalBase+$56(a5)
	move.w	#$C2C,g_PalBase+$58(a5)
	move.w	#$C2C,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E4C:
	move.w	#$E4E,g_PalBase+$54(a5)
	move.w	#$E4E,g_PalBase+$56(a5)
	move.w	#$E4E,g_PalBase+$58(a5)
	move.w	#$E4E,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E68:
	move.w	#$C2C,g_PalBase+$54(a5)
	move.w	#$C2C,g_PalBase+$56(a5)
	move.w	#$C2C,g_PalBase+$58(a5)
	move.w	#$C2C,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034E84:
	move.w	#$A2A,g_PalBase+$54(a5)
	move.w	#$A2A,g_PalBase+$56(a5)
	move.w	#$A2A,g_PalBase+$58(a5)
	move.w	#$A2A,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
