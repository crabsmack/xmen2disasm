; ---------------------------------------------------------------------------
; sub_0475E0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0475E0:
	link.w	a6,#$0
	tst.w	-$3B0E(a5)
	bne.s	loc_047606
	moveq	#$1,d0
	and.l	g_VBlankCount(a5),d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> sub_1FAD44
loc_047606:
	unlk	a6
	rts
