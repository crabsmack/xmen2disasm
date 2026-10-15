; ---------------------------------------------------------------------------
; BioBalls_Update - BIOBALLS per-frame update, a slimmed replacement of ACTOR Update: Move (unless flag $4000), advance the animation by distance (unless hurt), count down +$6E, run the state at +$5C when the +$6C delay is out, then refresh the box with BioBalls_UpdateBox when +$98 bit $400 is set (class slot 17, +$4A; does not call the parent)
; In:  8(a6) = this
; Out: d0 = garbage
; Evidence: method 17 of class descriptor $1203AC (name string "BIOBALLS", parent ACTOR)
; ---------------------------------------------------------------------------
BioBalls_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_11E908
	moveq	#$2,d7
	bra.s	loc_11E90A
loc_11E908:
	moveq	#$1,d7
loc_11E90A:
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.w	#$4000,d0
	and.w	$6(a4),d0
	bne.s	loc_11E92C
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_11E92C:
	moveq	#$4,d0
	and.w	$4(a4),d0
	bne.s	loc_11E954
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> Anim_AdvanceByDistance
	tst.b	d0
	lea.l	$10(a7),a7
loc_11E954:
	move.w	#$200,d0
	and.w	$4(a4),d0
	bne.s	loc_11E9A8
	tst.w	$6E(a4)
	ble.s	loc_11E972
	sub.w	d7,$6E(a4)
	tst.w	$6E(a4)
	bge.s	loc_11E972
	clr.w	$6E(a4)
loc_11E972:
	tst.w	$6C(a4)
	ble.s	loc_11E990
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_11E9A8
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_11E9A8
	clr.w	$6C(a4)
	bra.s	loc_11E9A8
loc_11E990:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_11E9C2
loc_11E9A8:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_11E9C2
	move.w	#$400,d0
	and.w	$98(a4),d0
	beq.s	loc_11E9C2
	move.l	a4,-(a7)
	jsr	BioBalls_UpdateBox(pc)
	addq.w	#$4,a7
loc_11E9C2:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
