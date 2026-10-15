; ---------------------------------------------------------------------------
; HoloBolt_Update - HoloBolt: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $0E83AC (name string "HOLOBOLT", parent ACTOR)
; ---------------------------------------------------------------------------
HoloBolt_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_0E81B4
	moveq	#$2,d0
	bra.s	loc_0E81B6
loc_0E81B4:
	moveq	#$1,d0
loc_0E81B6:
	move.w	d0,d7
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	cmp.w	-$35C2(a5),d5
	bgt.s	loc_0E81F0
	cmp.w	-$35C0(a5),d5
	blt.s	loc_0E81F0
	cmp.w	-$35C6(a5),d6
	bgt.s	loc_0E81F0
	cmp.w	-$35C4(a5),d6
	bge.s	loc_0E8200
loc_0E81F0:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_0E82DA
loc_0E8200:
	move.w	$A(a4),d6
	move.w	$E(a4),d5
	move.w	#$4000,d0
	and.w	$6(a4),d0
	bne.s	loc_0E822A
loc_0E8212:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	subq.w	#$1,d7
	bne.s	loc_0E8212
loc_0E822A:
	tst.b	-$38DE(a5)
	beq.s	loc_0E8234
	moveq	#$2,d0
	bra.s	loc_0E8236
loc_0E8234:
	moveq	#$1,d0
loc_0E8236:
	ext.w	d0
	move.w	d0,d7
	ext.l	d5
	move.l	$C(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	$8(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> Anim_AdvanceByDistance
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_0E8266
	ori.w	#$8,$4(a4)
loc_0E8266:
	move.w	#$200,d0
	and.w	$4(a4),d0
	bne.s	loc_0E82A6
	tst.w	$6C(a4)
	ble.s	loc_0E828E
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_0E82A6
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_0E82A6
	clr.w	$6C(a4)
	bra.s	loc_0E82A6
loc_0E828E:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_0E82DA
loc_0E82A6:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_0E82DA
	ext.l	d6
	cmp.l	$8(a4),d6
	bne.s	loc_0E82BE
	ext.l	d5
	cmp.l	$C(a4),d5
	beq.s	loc_0E82C4
loc_0E82BE:
	ori.w	#$8,$4(a4)
loc_0E82C4:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_0E82DA
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	andi.w	#$FFF7,$4(a4)
	addq.w	#$4,a7
loc_0E82DA:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
