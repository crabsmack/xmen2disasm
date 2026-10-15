; ---------------------------------------------------------------------------
; Magneto_BombOrigin_Case1 - Magneto_BombOrigin switch case 1 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_BombOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_BombOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_BombOrigin_Case1:
	move.w	#$FFBB,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$E100,(a0)
	bra.w	Magneto_BombOrigin_Ret
