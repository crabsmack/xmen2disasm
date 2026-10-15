; ---------------------------------------------------------------------------
; BroodBoss_ActWait60	[jt 631]
; ---------------------------------------------------------------------------
BroodBoss_ActWait60:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$92(a4)
	bne.s	loc_086D7C
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_086DAA
loc_086D7C:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_086D90
	clr.w	$90(a4)
loc_086D90:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_086DAA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
