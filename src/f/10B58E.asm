; ---------------------------------------------------------------------------
; Elevator_Init - Elevator: set position (+4 long), speed (+8), acceleration (+$A); moving up, no cooldown
; In:  8(a6) = this  $C(a6) = long position  $12(a6) = word speed  $16(a6) = word acceleration
; Out: none
; Evidence: method 1 of ELEVATOR; SpaceElev_Setup calls it with (0, 0, $40)
; ---------------------------------------------------------------------------
Elevator_Init:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$8(a6),a4
	move.l	$C(a6),$4(a4)
	move.w	d7,$8(a4)
	move.w	$16(a6),$A(a4)
	move.w	d7,$C(a4)
	move.w	#$FFFF,$E(a4)
	move.b	#$1,$10(a4)
	clr.w	$12(a4)
	clr.b	$11(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
