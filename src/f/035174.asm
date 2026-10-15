; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part6 - part 6 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes; ends with rts
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part6:
	addq.w	#$1,g_SceneVar3B3C(a5)
	moveq	#$F,d0
	cmp.w	g_SceneVar3B3C(a5),d0
	bne.s	loc_035184
	clr.w	g_SceneVar3B3C(a5)
loc_035184:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
