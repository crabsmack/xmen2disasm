; ---------------------------------------------------------------------------
; sub_0BD04C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BD04C:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$36,d6
	moveq	#-$34,d7
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BD076
	move.l	#$8000,d0
	bra.s	loc_0BD078
loc_0BD076:
	moveq	#$0,d0
loc_0BD078:
	move.l	d0,d5
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BD08A
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_0BD08A:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BD0A0
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
	ori.l	#$800,d5
loc_0BD0A0:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	ext.l	d7
	move.l	d7,d4
	lsl.l	#$8,d4
	ori.l	#$A,d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> sub_119190
	pea.l	($EE).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EE).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.l	$98(a4)
	lea.l	$20(a7),a7
	bne.s	loc_0BD0F2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BD11E
loc_0BD0F2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BD106
	clr.w	$96(a4)
loc_0BD106:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BD11E:
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
