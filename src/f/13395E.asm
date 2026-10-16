; ---------------------------------------------------------------------------
; Rocket_SetAngleOwner - rocket set-up: priority bit from the owner (or high without one), flight angle +$8C, nudge x by 6 toward the angle
; In:  8(a6) = rocket  $C(a6) = owner or 0  $12(a6) = word angle (0/45/90/135/180/270)
; Out: none (the two words after the angle are unused margins)
; Evidence: callers Rocket_SetAngleA/B; angles used by BrainRocket_StateSetDirection
; ---------------------------------------------------------------------------
Rocket_SetAngleOwner:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	beq.s	loc_133986
	moveq	#$4,d0
	and.b	$2E(a3),d0
	beq.s	loc_13398C
	ori.b	#$4,$2E(a4)
	bra.s	loc_13398C
loc_133986:
	ori.b	#$4,$2E(a4)
loc_13398C:
	move.w	d7,$8C(a4)
	bne.s	loc_133998
	addq.l	#$6,$8(a4)
	bra.s	loc_13399C
loc_133998:
	subq.l	#$6,$8(a4)
loc_13399C:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
