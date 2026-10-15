; ---------------------------------------------------------------------------
; Gambit_GroundThrow - ground throw: throw the cards and recover (crouched for throw kind 4)
; In:  8(a6) = player
; Out: none
; Evidence: Gambit_ThrowCards, +$6C = $FF, +$5C = XPlayer_CrouchAttackRecover if +$C2 = 4 else XPlayer_AttackRecover
; ---------------------------------------------------------------------------
Gambit_GroundThrow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Gambit_ThrowCards(pc)
	move.w	#$FF,$6C(a4)
	moveq	#$0,d0
	move.b	$C2(a4),d0
	cmpi.w	#$4,d0
	bne.s	loc_1CFB04
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1CFB0C
loc_1CFB04:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
loc_1CFB0C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
