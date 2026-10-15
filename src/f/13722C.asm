; ---------------------------------------------------------------------------
; Hornet_SpawnForDeathbird_Finish - tail of Hornet_SpawnForDeathbird: install Hornet_MoveVelocity, Hornet_StateDropIn and the circle path, return the hornet
; In:  a4 = new hornet
; Out: d0 = hornet
; Evidence: +$94/+$5C/+$98 writes, +$98 = jt 1784 Tbl_HornetCirclePath
; ---------------------------------------------------------------------------
Hornet_SpawnForDeathbird_Finish:
	lea.l	Hornet_MoveVelocity(pc),a0
	move.l	a0,$94(a4)
	lea.l	Hornet_StateDropIn(pc),a0
	move.l	a0,$5C(a4)
	lea.l	$37E2(a5),a0
	move.l	$2(a0),$98(a4)
loc_137246:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
