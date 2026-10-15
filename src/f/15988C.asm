; ---------------------------------------------------------------------------
; Magneto_BombOrigin_Case4 - Magneto_BombOrigin switch case 4 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_BombOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_BombOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_BombOrigin_Case4:
	move.w	#$FFF0,(a4)
	move.w	#$79,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	bra.s	Magneto_BombOrigin_Ret
loc_1598A0:
	move.w	#$10,(a4)
	move.w	#$79,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	bra.s	Magneto_BombOrigin_Ret
loc_1598B4:
	move.w	#$3D,(a4)
	move.w	#$67,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	bra.s	Magneto_BombOrigin_Ret
