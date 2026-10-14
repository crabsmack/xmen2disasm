; ---------------------------------------------------------------------------
; loc_0C0A1C
; ---------------------------------------------------------------------------
loc_0C0A1C:
	clr.w	$A8(a4)
	movea.l	$A4(a4),a0
	move.w	(a0),d0
	ext.l	d0
	divs.w	#$2,d0
	move.w	d0,$AA(a4)
	addq.w	#$1,$A8(a4)
	subq.w	#$1,$AA(a4)
	clr.w	$6C(a4)
	lea.l	sub_0C0A52(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
