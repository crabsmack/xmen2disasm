; ---------------------------------------------------------------------------
; Psylocke_GroundSpecialDown - PSYLOCKE slot +$E2: Down+A: crouching psychic blade
; In:  8(a6) = player
; Out: none
; Evidence: like Psylocke_GroundSpecial with animations Tbl_PsylockeAnim7_2 (jt $459A)/$47A2; next XPlayer_CrouchAttackRecover
; ---------------------------------------------------------------------------
Psylocke_GroundSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1B9CEA
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9CF8
loc_1B9CEA:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9CF8:
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1B9D18
	move.b	#$F,$71(a4)
	lea.l	$45A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_1B9D2E
loc_1B9D18:
	move.b	#$D,$71(a4)
	lea.l	$459A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1B9D2E:
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
