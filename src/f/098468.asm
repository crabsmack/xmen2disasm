; ---------------------------------------------------------------------------
; sub_098468	[link-after-rts]
; ---------------------------------------------------------------------------
sub_098468:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_098484
	moveq	#$1,d1
	bra.s	loc_098486
loc_098484:
	moveq	#$0,d1
loc_098486:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	$BA(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E4A(a5)	; -> sub_1595EE
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$1C(a7),a7
	bne.s	loc_0984BE
	pea.l	($83).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($83).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_0984BE:
	move.w	$BA(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E42(a5)	; -> sub_15926A
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_098520
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_0984F0
	move.l	$64(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_09855E
loc_0984F0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_098504
	clr.w	$96(a4)
loc_098504:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_09855E
loc_098520:
	tst.l	$98(a4)
	bne.s	loc_098532
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09855E
loc_098532:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_098546
	clr.w	$96(a4)
loc_098546:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_09855E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
