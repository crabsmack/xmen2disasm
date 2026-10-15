; ---------------------------------------------------------------------------
; BioBalls_Init - BioBalls: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $1203AC (name string "BIOBALLS", parent ACTOR)
; ---------------------------------------------------------------------------
BioBalls_Init:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.l	$10(a6),d4
	move.l	$C(a6),d5
	movea.l	$8(a6),a4
	move.l	d5,d6
	asr.l	#$8,d6
	move.l	d4,d7
	asr.l	#$8,d7
	move.l	$14(a6),-(a7)
	move.l	d4,-(a7)
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$32FA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	BioBalls_ActCollapse(pc),a0
	move.l	a0,$5C(a4)
	lea.l	BioBalls_ActCollapse(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$1083,$6(a4)
	lea.l	$33FA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11E876
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11E86E
	ori.b	#$4,$2E(a4)
	bra.s	loc_11E8BC
loc_11E86E:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11E8BC
loc_11E876:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11E8A6
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_11E89E
	ori.b	#$4,$2E(a4)
	bra.s	loc_11E8BC
loc_11E89E:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11E8BC
loc_11E8A6:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11E8B6
	ori.b	#$4,$2E(a4)
	bra.s	loc_11E8BC
loc_11E8B6:
	andi.b	#$FB,$2E(a4)
loc_11E8BC:
	move.l	-$1A98(a5),$92(a4)
	clr.w	$98(a4)
	clr.b	$96(a4)
	moveq	#$0,d0
	move.l	d0,$9A(a4)
	clr.l	$9E(a4)
	move.l	d0,$A2(a4)
	move.w	d6,$4E(a4)
	move.w	d6,$52(a4)
	move.w	d7,$4C(a4)
	move.w	d7,$50(a4)
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
