; ---------------------------------------------------------------------------
; BioFlame_Init - BioFlame: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $11B6D4 (name string "BIOFLAME", parent ACTOR)
; ---------------------------------------------------------------------------
BioFlame_Init:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$3082(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a3,d0
	beq.s	loc_11BB98
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	bra.s	loc_11BBA8
loc_11BB98:
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$10(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$12(a4)
loc_11BBA8:
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	-$1A88(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	ori.w	#$83,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11BC12
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11BC0A
	ori.b	#$4,$2E(a4)
	bra.s	loc_11BC58
loc_11BC0A:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11BC58
loc_11BC12:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11BC42
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_11BC3A
	ori.b	#$4,$2E(a4)
	bra.s	loc_11BC58
loc_11BC3A:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11BC58
loc_11BC42:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11BC52
	ori.b	#$4,$2E(a4)
	bra.s	loc_11BC58
loc_11BC52:
	andi.b	#$FB,$2E(a4)
loc_11BC58:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.l	$90(a4)
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	clr.w	$94(a4)
	move.w	#$A,$96(a4)
	move.w	#$14,$98(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
