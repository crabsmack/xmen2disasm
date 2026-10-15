; ---------------------------------------------------------------------------
; sub_087370	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087370:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$1C4,d0
	bge.s	loc_08739E
	clr.w	$6C(a4)
	lea.l	sub_087370(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_08741E
loc_08739E:
	moveq	#$D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$A2(a4)
	addq.w	#$8,a7
	beq.s	loc_0873D0
	lea.l	$1452(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$A2(a4),-(a7)
	jsr	$2E3A(a5)	; -> ICandy_SetAnim
	movea.l	$A2(a4),a0
	move.b	#$1,$1D(a0)
	addq.w	#$8,a7
loc_0873D0:
	lea.l	$14CA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	movea.l	$96(a4),a0
	move.w	#$A00,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	tst.l	$9E(a4)
	beq.s	loc_08740C
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	LittleLeg_SetWalking(pc)
	addq.w	#$8,a7
loc_08740C:
	clr.w	$6C(a4)
	lea.l	sub_087426(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08741E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
