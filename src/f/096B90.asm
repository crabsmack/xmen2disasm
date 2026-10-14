; ---------------------------------------------------------------------------
; sub_096B90	[jt 745]
; ---------------------------------------------------------------------------
sub_096B90:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	bne.s	loc_096BE4
	tst.l	$98(a4)
	bne.s	loc_096BB6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096C26
loc_096BB6:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096BCA
	clr.w	$96(a4)
loc_096BCA:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096C26
loc_096BE4:
	move.l	a3,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	move.l	d0,-$4(a6)
	movea.l	d0,a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,$10(a3)
	movea.l	-$4(a6),a0
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$50(a0),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,$12(a3)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_096C30(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_096C26:
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
