; ---------------------------------------------------------------------------
; SavageBio_StateFireVertical - SAVAGE bio state: fire a BRAINROCKET from (+-8, -+$72) at angle $5A (or $10E when v-flipped), next step after 10 frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateFireVertical:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB2C6
	moveq	#$8,d0
	bra.s	loc_0BB2C8
loc_0BB2C6:
	moveq	#-$8,d0
loc_0BB2C8:
	move.w	d0,d6
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB2DA
	moveq	#-$72,d0
	bra.s	loc_0BB2DC
loc_0BB2DA:
	moveq	#$72,d0
loc_0BB2DC:
	move.w	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$8,d1
	add.l	$C(a4),d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$8,d1
	add.l	$8(a4),d1
	move.l	d1,-(a7)
	lea.l	$361A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$361A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0BB340
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB32C
	moveq	#$5A,d0
	bra.s	loc_0BB332
loc_0BB32C:
	move.l	#$10E,d0
loc_0BB332:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$35FA(a5)	; -> sub_1339A6
	lea.l	$C(a7),a7
loc_0BB340:
	tst.l	$98(a4)
	bne.s	loc_0BB354
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0BB382
loc_0BB354:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BB368
	clr.w	$96(a4)
loc_0BB368:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0BB382:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
