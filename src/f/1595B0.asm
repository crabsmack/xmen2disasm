; ---------------------------------------------------------------------------
; Magneto_ShotOrigin_Case7 - Magneto_ShotOrigin switch case 7 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotOrigin_Case7:
	move.w	#$63,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	Magneto_ShotOrigin_Ret
