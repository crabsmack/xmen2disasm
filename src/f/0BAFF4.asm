; ---------------------------------------------------------------------------
; SavageBio_StateFireMouth - SAVAGE bio state: fire a BRAINROCKET from the mouth (offset +-$30, -+$50) in the facing direction, next step after 10 frames
; In:  8(a6) = this
; Out: d0
; Evidence: BRAINROCKET ($133CFC) +$0E, Rocket_SetAngleA(rocket, this, 0 or $B4)
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateFireMouth:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB010
	moveq	#$30,d0
	bra.s	loc_0BB012
loc_0BB010:
	moveq	#-$30,d0
loc_0BB012:
	move.w	d0,d6
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB024
	moveq	#-$50,d0
	bra.s	loc_0BB026
loc_0BB024:
	moveq	#$50,d0
loc_0BB026:
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
	beq.s	loc_0BB08A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB076
	moveq	#$0,d0
	bra.s	loc_0BB07C
loc_0BB076:
	move.l	#$B4,d0
loc_0BB07C:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$35FA(a5)	; -> Rocket_SetAngleA
	lea.l	$C(a7),a7
loc_0BB08A:
	tst.l	$98(a4)
	bne.s	loc_0BB09E
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0BB0CC
loc_0BB09E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BB0B2
	clr.w	$96(a4)
loc_0BB0B2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0BB0CC:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
