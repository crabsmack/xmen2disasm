; ---------------------------------------------------------------------------
; Magneto_ShotOriginAir_Case3 - Magneto_ShotOriginAir switch case 3 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotOriginAir
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotOriginAir (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotOriginAir_Case3:
	move.w	#$FFBB,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$8700,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	Magneto_ShotOriginAir_Ret
loc_15942E:
	move.w	#$FFF0,(a4)
	move.w	#$84,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$C,(a0)
	bra.s	Magneto_ShotOriginAir_Ret
loc_15944A:
	move.w	#$10,(a4)
	move.w	#$84,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$C,(a0)
	bra.s	Magneto_ShotOriginAir_Ret
loc_159466:
	move.w	#$45,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	Magneto_ShotOriginAir_Ret
