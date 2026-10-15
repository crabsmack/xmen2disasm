; ---------------------------------------------------------------------------
; sub_15E55A	[jt 2064]
; ---------------------------------------------------------------------------
sub_15E55A:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$40,d0
	and.w	$6(a4),d0
	beq.s	loc_15E57E
	moveq	#$1,d0
	and.w	-$3A24(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.w	loc_15E626
loc_15E57E:
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_15E59E
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_15E59E
	moveq	#$1,d3
loc_15E59E:
	tst.b	d3
	beq.s	loc_15E5BA
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_15E5CA
loc_15E5BA:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_15E5CA:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_15E5EC
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_15E5EC
	moveq	#$1,d3
loc_15E5EC:
	tst.b	d3
	beq.s	loc_15E608
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_15E618
loc_15E608:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_15E618:
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
loc_15E626:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
