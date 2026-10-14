; ---------------------------------------------------------------------------
; sub_0958F6	[jt 721]
; ---------------------------------------------------------------------------
sub_0958F6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A8(a4),a3
	movea.l	a3,a0
	adda.w	$A(a0),a3
	andi.w	#$FDFF,$4(a4)
	andi.w	#$FFFB,$4(a4)
	ori.w	#$40,$6(a4)
	move.b	#$1E,$B6(a4)
	moveq	#$78,d0
	cmp.b	$B8(a4),d0
	bgt.s	loc_095930
	clr.b	$B8(a4)
loc_095930:
	cmpa.l	$98(a4),a3
	beq.s	loc_09595E
	move.l	a3,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	moveq	#$0,d0
	move.l	d0,$44(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.w	#$A,$6C(a4)
	lea.l	sub_095876(pc),a0
	move.l	a0,$5C(a4)
	addq.w	#$8,a7
loc_09595E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
