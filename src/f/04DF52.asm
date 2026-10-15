; ---------------------------------------------------------------------------
; ApocBomb_SetSpeed - set the APOCBOMB fall speed and its per-frame increase (and the accel timer's argument)
; In:  8(a6) = word timer arg, $C(a6) = word speed, $10(a6) = word increase
; Out: d0 = accel timer
; Evidence: -$3C70 speed, -$3C72 increase; timer -$3B20 +2; caller Apocalypse_ActStartBombs
; ---------------------------------------------------------------------------
ApocBomb_SetSpeed:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	-$3B20(a5),a4
	move.l	a4,d0
	beq.s	loc_04DF66
	move.w	$A(a6),$2(a4)
loc_04DF66:
	move.w	$E(a6),g_ApocBombSpeed(a5)
	move.w	$12(a6),g_ApocBombAccel(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
