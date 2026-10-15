; ---------------------------------------------------------------------------
; FluxBomb_StateThrown - thrown bomb flight: implode when it slows to speed $100 or drops below y $16C
; In:  8(a6) = bomb
; Out: d0
; Evidence: y > $16C00 -> clamp, speed +$8C = $100; speed <= $100 -> stop (+6 $4000), implode animation, FluxBomb_StartImplode, FluxBomb_StateImplode
; ---------------------------------------------------------------------------
FluxBomb_StateThrown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$16C00,$C(a4)
	ble.s	loc_158E9A
	move.l	#$16C00,$C(a4)
	move.w	#$100,$8C(a4)
loc_158E9A:
	cmpi.w	#$100,$8C(a4)
	bgt.s	loc_158ED4
	ori.w	#$4000,$6(a4)
	lea.l	$478A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	FluxBomb_StartImplode(pc)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	FluxBomb_StateImplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_158EE6
loc_158ED4:
	clr.w	$6C(a4)
	lea.l	FluxBomb_StateThrown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_158EE6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
