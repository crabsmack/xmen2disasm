; ---------------------------------------------------------------------------
; BroodClaw_Update - vtable +$4A: per-frame update of a BROODCLAW
; In:  8(a6) = this
; Evidence: slot +$4A of the BROODCLAW descriptor $09B98C; TAS frames 49293-52535 (2593 frames active)
; ---------------------------------------------------------------------------
BroodClaw_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_09AE96
	moveq	#$2,d7
	bra.s	loc_09AE98
loc_09AE96:
	moveq	#$1,d7
loc_09AE98:
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	beq.s	loc_09AEC4
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_09AEC4:
	move.w	#$200,d0
	and.w	$4(a4),d0
	bne.s	loc_09AF18
	tst.w	$6E(a4)
	ble.s	loc_09AEE2
	sub.w	d7,$6E(a4)
	tst.w	$6E(a4)
	bge.s	loc_09AEE2
	clr.w	$6E(a4)
loc_09AEE2:
	tst.w	$6C(a4)
	ble.s	loc_09AF00
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_09AF18
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_09AF18
	clr.w	$6C(a4)
	bra.s	loc_09AF18
loc_09AF00:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_09AF34
loc_09AF18:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_09AF34
	cmp.l	$8(a4),d5
	bne.s	loc_09AF2C
	cmp.l	$C(a4),d6
	beq.s	loc_09AF34
loc_09AF2C:
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_09AF34:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
