; ---------------------------------------------------------------------------
; sub_0973B4	[jt 751]
; ---------------------------------------------------------------------------
sub_0973B4:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$9C(a3),a4
	move.l	a4,d0
	beq.s	loc_09740A
	move.l	$8(a4),d7
	asr.l	#$8,d7
	lea.l	$33BA(a5),a0
	move.l	a0,$A2(a4)
	move.l	a4,-(a7)
	jsr	$338A(a5)	; -> sub_11F22C
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	sub.w	d7,d1
	move.w	d1,$9E(a4)
	move.w	#$FF40,$A0(a4)
	clr.b	$96(a4)
	lea.l	$335A(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	addq.w	#$4,a7
loc_09740A:
	clr.w	$6C(a3)
	lea.l	XClone_StateWaitChild(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
