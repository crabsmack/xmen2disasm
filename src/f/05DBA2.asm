; ---------------------------------------------------------------------------
; Tuskette_StateExitTurn - TUSKETTE: turn round and walk at $200
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Tuskette_StateExitBack
; ---------------------------------------------------------------------------
Tuskette_StateExitTurn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	eori.b	#$10,$2E(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05DBC2
	move.l	#$FFFFFE00,d0
	bra.s	loc_05DBC8
loc_05DBC2:
	move.l	#$200,d0
loc_05DBC8:
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	Tuskette_StateExitBack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
