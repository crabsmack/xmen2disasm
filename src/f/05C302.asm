; ---------------------------------------------------------------------------
; Tusk_StateIntroWait - TUSK: wait for the intro timer
; In:  8(a6) = this
; Out: none
; Evidence: next Tusk_StateBoulderRain
; ---------------------------------------------------------------------------
Tusk_StateIntroWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_05C31C
	lea.l	Tusk_StateBoulderRain(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C31C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
