; ---------------------------------------------------------------------------
; SmallBrood_StateWaitForPlayer - SMALLBROOD state: idle until a player comes within +-$D4 x / +-$50 y, then start the AI script
; In:  8(a6) = this
; Out: none
; Evidence: checks both player objects ($FFEAA8/$FFE9B8) alive; starts script step 0 (or +$64); set by SmallBrood_Init case 1; TAS 46167-48690
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateWaitForPlayer:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	sub.l	#$D4,d5
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	moveq	#$50,d0
	sub.l	d0,d6
	ext.l	d5
	move.l	d5,d1
	add.l	#$1A8,d1
	move.w	d1,-$2(a6)
	ext.l	d6
	move.l	d6,d4
	add.l	#$A0,d4
	lea.l	$11E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	moveq	#$0,d7
	addq.w	#$8,a7
loc_084FAA:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_084FBA
	lea.l	g_Player1(a5),a3
	move.l	a3,d0
	bra.s	loc_084FC0
loc_084FBA:
	lea.l	g_Player2(a5),a3
	move.l	a3,d0
loc_084FC0:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_08502A
	cmp.w	$52(a3),d5
	bgt.s	loc_08502A
	move.w	-$2(a6),d0
	cmp.w	$4E(a3),d0
	blt.s	loc_08502A
	cmp.w	$50(a3),d6
	bgt.s	loc_08502A
	cmp.w	$4C(a3),d4
	blt.s	loc_08502A
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	bne.s	loc_08500E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_08502A
loc_08500E:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_08502A:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_084FAA
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
