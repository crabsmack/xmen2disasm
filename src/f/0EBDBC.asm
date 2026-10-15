; ---------------------------------------------------------------------------
; CoreZap_Update - CoreZap: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $0ECA12 (name string "COREZAP", parent ACTOR)
; ---------------------------------------------------------------------------
CoreZap_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0EBDD2
	moveq	#$2,d0
	bra.s	loc_0EBDD4
loc_0EBDD2:
	moveq	#$1,d0
loc_0EBDD4:
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
	bgt.s	loc_0EBE0E
	cmp.w	-$35C0(a5),d5
	blt.s	loc_0EBE0E
	cmp.w	-$35C6(a5),d6
	bgt.s	loc_0EBE0E
	cmp.w	-$35C4(a5),d6
	bge.s	loc_0EBE1C
loc_0EBE0E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_0EBE74
loc_0EBE1C:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	subq.w	#$1,d7
	bne.s	loc_0EBE1C
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.l	$C(a4),d6
	asr.l	#$8,d6
	move.w	d5,d0
	sub.w	#$10,d0
	move.w	d0,$56(a4)
	move.w	d5,d0
	add.w	#$10,d0
	move.w	d0,$5A(a4)
	move.w	d6,d0
	subq.w	#$5,d0
	move.w	d0,$54(a4)
	move.w	d6,d0
	add.w	#$A,d0
	move.w	d0,$58(a4)
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	CoreZap_HitActor(pc)
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	CoreZap_HitActor(pc)
	lea.l	$10(a7),a7
loc_0EBE74:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
