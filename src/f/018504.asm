; ---------------------------------------------------------------------------
; sub_018504	[link-after-rts]
; ---------------------------------------------------------------------------
sub_018504:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	a4,a3
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$21,d7
	moveq	#-$31,d5
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_01853E
	move.l	#$8000,d0
	bra.s	loc_018540
loc_01853E:
	moveq	#$0,d0
loc_018540:
	move.l	d0,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	beq.s	loc_01855A
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	ori.l	#$800,d6
loc_01855A:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,-$4(a6)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	add.l	d0,d4
	ori.l	#$A,d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> sub_119190
	pea.l	($B0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($B0).w
	jsr	$521A(a5)	; -> Snd_Play
	subq.w	#$1,$A2(a4)
	lea.l	$20(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_0185BE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
