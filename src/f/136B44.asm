; ---------------------------------------------------------------------------
; Hornet_StateAttackDelay - Hornet state: wait the attack delay +$A6, then face the player and start a volley
; In:  8(a6) = this
; Out: d0 = flags & 8 (unused)
; Evidence: +$6C = +$A6 (or run Hornet_StateFacePlayer now when +$A6 = -1), +$5C = Hornet_StateFacePlayer; Hornet_Init's first state
; ---------------------------------------------------------------------------
Hornet_StateAttackDelay:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	cmp.w	$A6(a4),d0
	bne.s	loc_136B68
	lea.l	Hornet_StateFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Hornet_StateFacePlayer(pc)
	addq.w	#$4,a7
	bra.s	loc_136B7C
loc_136B68:
	move.w	$A6(a4),$6C(a4)
	lea.l	Hornet_StateFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136B7C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
