; ---------------------------------------------------------------------------
; XPlayer_GroundAttack - XPLAYER slot +$D2: B on the ground: stop and play the first attack of the combo
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: attack sound char +$2C, vx/accel 0, +$6E = char +$22 (combo window), Obj_SetAnim(char +$36), state XPlayer_StateAttackCombo
; ---------------------------------------------------------------------------
XPlayer_GroundAttack:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F2F48
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F2F48:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F2F66
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F2F74
loc_1F2F66:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F2F74:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$22(a0),d0
	move.w	d0,$6E(a4)
	movea.l	a0,a1
	adda.w	$36(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	XPlayer_StateAttackCombo(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
