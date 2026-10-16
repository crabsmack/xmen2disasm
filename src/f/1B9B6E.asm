; ---------------------------------------------------------------------------
; Psylocke_AirSpecial - PSYLOCKE slot +$C6: mid-air special: psychic dash toward the held direction
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: gravity char +$E; Left/Right -> vx and max +/-$708; health <= $700 -> type +$71 = $D + animation Tbl_PsylockeAnim9_2 (jt $45AA), else $F + $47B2; state Psylocke_StateAirDash
; ---------------------------------------------------------------------------
Psylocke_AirSpecial:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9B98
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B9BA0
loc_1B9B98:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B9BA0:
	beq.s	loc_1B9BBA
	ori.b	#$10,$2E(a4)
	move.w	#$708,$22(a4)
	move.w	#$F8F8,$16(a4)
	clr.w	$1E(a4)
	bra.s	loc_1B9BEE
loc_1B9BBA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9BCE
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B9BD6
loc_1B9BCE:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B9BD6:
	beq.s	loc_1B9BEE
	andi.b	#$EF,$2E(a4)
	move.w	#$708,$22(a4)
	move.w	#$708,$16(a4)
	clr.w	$1E(a4)
loc_1B9BEE:
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1B9C0E
	move.b	#$F,$71(a4)
	lea.l	$45B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_1B9C24
loc_1B9C0E:
	move.b	#$D,$71(a4)
	lea.l	$45AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1B9C24:
	clr.w	$6C(a4)
	lea.l	Psylocke_StateAirDash(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
