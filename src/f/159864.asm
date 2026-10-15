; ---------------------------------------------------------------------------
; Magneto_BombOrigin_Case2 - Magneto_BombOrigin switch case 2 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_BombOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_BombOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_BombOrigin_Case2:
	move.w	#$FFB3,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	move.l	#$B400,(a0)
	bra.s	Magneto_BombOrigin_Ret
loc_159878:
	move.w	#$FFC3,(a4)
	move.w	#$67,(a3)
	movea.l	$14(a6),a0
	move.l	#$8700,(a0)
	bra.s	Magneto_BombOrigin_Ret
