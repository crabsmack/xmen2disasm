; ---------------------------------------------------------------------------
; Magneto_ShotOriginAir_Case7 - Magneto_ShotOriginAir switch case 7 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotOriginAir
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotOriginAir (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotOriginAir_Case7:
	move.w	#$63,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	Magneto_ShotOriginAir_Ret
loc_15949C:
	move.w	#$45,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$13B00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
