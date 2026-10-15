; ---------------------------------------------------------------------------
; BaniMazaA1_FrameHook_tail - BaniMazaA1_FrameHook loop tail: animate the blocks, repeat for the second frame at half rate
; In:  d7 = frames left
; Out: none
; Evidence: BaniMazaA1_AnimateBlocks then loop to loc_0389CC
; ---------------------------------------------------------------------------
BaniMazaA1_FrameHook_tail:
	jsr	BaniMazaA1_AnimateBlocks(pc)
	subq.w	#$1,d7
	bne.w	loc_0389CC
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
