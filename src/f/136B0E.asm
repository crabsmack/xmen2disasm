; ---------------------------------------------------------------------------
; sub_136B0E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136B0E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1366A2(pc)
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	blt.s	loc_136B3A
	move.w	#$A,$6E(a4)
	lea.l	sub_136AA6(pc),a0
	move.l	a0,$94(a4)
loc_136B3A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
