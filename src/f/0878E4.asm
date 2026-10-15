; ---------------------------------------------------------------------------
; BroodBoss_StateScream - BROODBOSS state: count +$8E down (1 or 2 per frame), then the next step
; In:  8(a6) = this
; Out: d0
; Evidence: SetFrame(0); clears -$3B0C bit $40 while counting
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateScream:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d7
	tst.b	-$38DE(a5)
	beq.s	loc_0878FA
	lsl.w	#$1,d7
loc_0878FA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.w	$8E(a4)
	addq.w	#$8,a7
	ble.s	loc_08792E
	sub.w	d7,$8E(a4)
	andi.w	#$FFBF,-$3B0C(a5)
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateScream(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_087970
loc_08792E:
	clr.w	$8E(a4)
	tst.l	$92(a4)
	bne.s	loc_087944
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_087970
loc_087944:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_087958
	clr.w	$90(a4)
loc_087958:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_087970:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
