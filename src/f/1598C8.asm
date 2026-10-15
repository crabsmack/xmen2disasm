; ---------------------------------------------------------------------------
; Magneto_BombOrigin_Case7 - Magneto_BombOrigin switch case 7 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_BombOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_BombOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_BombOrigin_Case7:
	move.w	#$4D,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
	bra.s	Magneto_BombOrigin_Ret
