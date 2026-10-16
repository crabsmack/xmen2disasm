; ---------------------------------------------------------------------------
; Psylocke_GroundSpecial - PSYLOCKE slot +$DE: ground special: psychic blade strike (stronger above 7 health)
; In:  8(a6) = player
; Out: none
; Evidence: stop, clear A latch; type +$71 = $D + animation Tbl_PsylockeAnim5_2 (jt $458A), or $F + $4792 above $700 health; next XPlayer_AttackRecover
; ---------------------------------------------------------------------------
Psylocke_GroundSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1B9C68
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9C76
loc_1B9C68:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9C76:
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1B9C96
	move.b	#$F,$71(a4)
	lea.l	$4592(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_1B9CAC
loc_1B9C96:
	move.b	#$D,$71(a4)
	lea.l	$458A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1B9CAC:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
