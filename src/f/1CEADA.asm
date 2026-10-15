; ---------------------------------------------------------------------------
; Magneto_GroundSpecialDown - MAGNETO slot +$E2: Down+A: crouched flux bomb straight ahead
; In:  8(a6) = player
; Out: none
; Evidence: +$10 = 1 (crouch), +$BC = 7/2; Magneto_StartBomb
; ---------------------------------------------------------------------------
Magneto_GroundSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1,$10(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEAFA
	move.w	#$7,$BC(a4)
	bra.s	loc_1CEB00
loc_1CEAFA:
	move.w	#$2,$BC(a4)
loc_1CEB00:
	lea.l	Magneto_StartBomb(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartBomb(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
