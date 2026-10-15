; ---------------------------------------------------------------------------
; sub_087582	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087582:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$1C4,d0
	bge.s	loc_0875AE
	clr.w	$6C(a4)
	lea.l	sub_087582(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0875F8
loc_0875AE:
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	tst.l	$9E(a4)
	beq.s	loc_0875DC
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	sub_085BE8(pc)
	addq.w	#$8,a7
loc_0875DC:
	lea.l	$14CA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	clr.w	$6C(a4)
	lea.l	sub_087600(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0875F8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
