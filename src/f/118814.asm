; ---------------------------------------------------------------------------
; ICandy_PoolFree - mark an ICandy pool slot free (clear bit 15 of word +4)
; In:  8(a6) = slot
; Out: none
; Evidence: only caller ICandy_Destroy
; ---------------------------------------------------------------------------
ICandy_PoolFree:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	andi.w	#$7FFF,$4(a0)
	unlk	a6
	rts
