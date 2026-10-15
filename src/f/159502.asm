; ---------------------------------------------------------------------------
; Magneto_ShotOrigin_Case1 - Magneto_ShotOrigin switch case 1 (with the cases that fall into it): set this case's results, then the common exit
; In:  a6 frame of Magneto_ShotOrigin
; Out: d0 / output pointers as set by the case
; Evidence: jump-table target of the switch in Magneto_ShotOrigin (Sw_ table in xmen2.asm)
; ---------------------------------------------------------------------------
Magneto_ShotOrigin_Case1:
	move.w	#$FFBB,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$E100,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	Magneto_ShotOrigin_Ret
loc_159520:
	move.w	#$FF9D,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	move.l	#$B400,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	Magneto_ShotOrigin_Ret
loc_15953E:
	move.w	#$FFBB,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$8700,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	Magneto_ShotOrigin_Ret
loc_15955C:
	move.w	#$FFF2,(a4)
	move.w	#$8F,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.s	Magneto_ShotOrigin_Ret
loc_159578:
	move.w	#$E,(a4)
	move.w	#$8F,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	Magneto_ShotOrigin_Ret
loc_159594:
	move.w	#$45,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	Magneto_ShotOrigin_Ret
