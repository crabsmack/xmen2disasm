; ---------------------------------------------------------------------------
; Gambit_StateAirKick - air kick in progress: on landing or when timer +$A8 runs out, mark the kick used (+$90 bit 1) and return to control
; In:  8(a6) = player
; Out: d0
; Evidence: grounded or word +$A8 < 1 -> +$90 |= 2, +$5C = StateControl
; ---------------------------------------------------------------------------
Gambit_StateAirKick:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1D057A
	tst.w	$A8(a4)
	bgt.s	loc_1D0594
loc_1D057A:
	ori.l	#$2,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1D0594:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
