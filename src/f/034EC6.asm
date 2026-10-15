; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part3 - part 3 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part3:
	move.w	#$828,g_PalBase+$54(a5)
	move.w	#$828,g_PalBase+$56(a5)
	move.w	#$828,g_PalBase+$58(a5)
	move.w	#$828,g_PalBase+$5A(a5)
	bra.w	AvalonA4_AnimatePalettes_part4
loc_034EE2:
	move.w	#$EEE,g_PalBase+$54(a5)
	move.w	#$A2A,g_PalBase+$56(a5)
	move.w	#$A2A,g_PalBase+$58(a5)
	move.w	#$A2A,g_PalBase+$5A(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034EFC:
	move.w	#$C2C,g_PalBase+$54(a5)
	move.w	#$EEE,g_PalBase+$56(a5)
	move.w	#$C2C,g_PalBase+$58(a5)
	move.w	#$C2C,g_PalBase+$5A(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F16:
	move.w	#$E4E,g_PalBase+$54(a5)
	move.w	#$E4E,g_PalBase+$56(a5)
	move.w	#$EEE,g_PalBase+$58(a5)
	move.w	#$E4E,g_PalBase+$5A(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F30:
	move.w	#$C2C,g_PalBase+$54(a5)
	move.w	#$C2C,g_PalBase+$56(a5)
	move.w	#$C2C,g_PalBase+$58(a5)
	move.w	#$EEE,g_PalBase+$5A(a5)
	bra.s	AvalonA4_AnimatePalettes_part4
loc_034F4A:
	move.w	#$A2A,g_PalBase+$54(a5)
	move.w	#$A2A,g_PalBase+$56(a5)
	move.w	#$A2A,g_PalBase+$58(a5)
	move.w	#$A2A,g_PalBase+$5A(a5)
