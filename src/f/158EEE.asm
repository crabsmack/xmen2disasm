; ---------------------------------------------------------------------------
; FluxBomb_StateImplode - wait for the implosion to finish (phase 2), then detonate
; In:  8(a6) = bomb
; Out: d0
; Evidence: +$100 == 2 -> FluxBomb_Detonate
; ---------------------------------------------------------------------------
FluxBomb_StateImplode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$100(a4),d0
	cmpi.w	#$2,d0
	bne.s	loc_158F18
	clr.w	$6C(a4)
	lea.l	FluxBomb_Detonate(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_158F2A
loc_158F18:
	clr.w	$6C(a4)
	lea.l	FluxBomb_StateImplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_158F2A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
