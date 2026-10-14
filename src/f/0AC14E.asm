; ---------------------------------------------------------------------------
; loc_0AC14E
; ---------------------------------------------------------------------------
loc_0AC14E:
	tst.w	$A(a3)
	beq.s	loc_0AC15A
	move.w	$A(a3),$92(a4)
loc_0AC15A:
	move.w	$E(a3),d0
	or.w	d0,$8C(a4)
loc_0AC162:
	move.w	d7,$24(a4)
	move.w	d7,$22(a4)
	move.w	d7,d0
	asr.w	#$1,d0
	move.w	d0,$16(a4)
	move.w	d7,d0
	asr.w	#$1,d0
	move.w	d0,$18(a4)
	move.w	$8C(a4),d0
	btst	#$0,d0
	beq.s	loc_0AC196
	lea.l	sub_0AB7A8(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0AB7A8(pc),a0
	move.l	a0,$64(a4)
	bra.s	loc_0AC1A6
loc_0AC196:
	lea.l	sub_0AB97C(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0AB97C(pc),a0
	move.l	a0,$64(a4)
loc_0AC1A6:
	lea.l	sub_0ABA4A(pc),a0
	move.l	a0,$60(a4)
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
