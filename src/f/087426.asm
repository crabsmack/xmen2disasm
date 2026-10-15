; ---------------------------------------------------------------------------
; sub_087426	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087426:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$180,d0
	ble.s	loc_087454
	clr.w	$6C(a4)
	lea.l	sub_087426(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_0874D4
loc_087454:
	lea.l	$147A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	tst.l	$9E(a4)
	addq.w	#$8,a7
	beq.s	loc_087492
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	sub_085BE8(pc)
	addq.w	#$8,a7
loc_087492:
	tst.l	$92(a4)
	bne.s	loc_0874A6
	move.l	$64(a4),$5C(a4)
	move.w	#$28,$6C(a4)
	bra.s	loc_0874D4
loc_0874A6:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0874BA
	clr.w	$90(a4)
loc_0874BA:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$28,$6C(a4)
loc_0874D4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
