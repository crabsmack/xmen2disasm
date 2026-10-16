; ---------------------------------------------------------------------------
; MagneticGlob_SetAnimForAngle - choose the bolt animation and flip for its flight angle (8 sectors)
; In:  8(a6) = bolt
; Out: none
; Evidence: angle +$92 >> 8 in 22/45-degree sectors -> +$9E animation (Tbl_MagneticGlobAnim18 (jt $475A)-$497A data) and +$A2 flip
; ---------------------------------------------------------------------------
MagneticGlob_SetAnimForAngle:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$92(a4),d7
	asr.l	#$8,d7
	tst.w	d7
	blt.s	loc_1580E0
	cmpi.w	#$16,d7
	bge.s	loc_1580E0
	clr.b	$A2(a4)
	lea.l	$4762(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.w	loc_1581C0
loc_1580E0:
	cmpi.w	#$16,d7
	blt.s	loc_1580FE
	cmpi.w	#$44,d7
	bge.s	loc_1580FE
	clr.b	$A2(a4)
	lea.l	$476A(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.w	loc_1581C0
loc_1580FE:
	cmpi.w	#$44,d7
	blt.s	loc_15811C
	cmpi.w	#$70,d7
	bge.s	loc_15811C
	clr.b	$A2(a4)
	lea.l	$4772(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.w	loc_1581C0
loc_15811C:
	cmpi.w	#$70,d7
	blt.s	loc_15813C
	cmpi.w	#$9E,d7
	bge.s	loc_15813C
	move.b	#$1,$A2(a4)
	lea.l	$476A(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.w	loc_1581C0
loc_15813C:
	cmpi.w	#$9E,d7
	blt.s	loc_15815A
	cmpi.w	#$CA,d7
	bge.s	loc_15815A
	move.b	#$1,$A2(a4)
	lea.l	$4762(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.s	loc_1581C0
loc_15815A:
	cmpi.w	#$CA,d7
	blt.s	loc_158178
	cmpi.w	#$F8,d7
	bge.s	loc_158178
	move.b	#$1,$A2(a4)
	lea.l	$475A(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.s	loc_1581C0
loc_158178:
	cmpi.w	#$F8,d7
	blt.s	loc_158196
	cmpi.w	#$124,d7
	bge.s	loc_158196
	move.b	#$1,$A2(a4)
	lea.l	$477A(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.s	loc_1581C0
loc_158196:
	cmpi.w	#$124,d7
	blt.s	loc_1581B2
	cmpi.w	#$152,d7
	bge.s	loc_1581B2
	clr.b	$A2(a4)
	lea.l	$475A(a5),a0
	move.l	$2(a0),$9E(a4)
	bra.s	loc_1581C0
loc_1581B2:
	clr.b	$A2(a4)
	lea.l	$4762(a5),a0
	move.l	$2(a0),$9E(a4)
loc_1581C0:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
