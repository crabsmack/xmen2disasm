; ---------------------------------------------------------------------------
; XPlayer_DoubleJump - start a double jump: animation, sound and an upward boost
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: clears C latch, Obj_SetAnim(char +$4C), sound char +$58, vy -= char +$52, gravity char +$E, state XPlayer_StateDoubleJump; slot +$B6 of NIGHTCRAWLER, PSYLOCKE, WOLVERINE
; ---------------------------------------------------------------------------
XPlayer_DoubleJump:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	bne.s	loc_1F2B0A
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F2B18
loc_1F2B0A:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F2B18:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$4C(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$58(a0),d0
	cmpi.w	#$FF,d0
	addq.w	#$8,a7
	beq.s	loc_1F2B5E
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$58(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$58(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F2B5E:
	movea.l	$8C(a4),a0
	move.w	$52(a0),d0
	sub.w	d0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$6C(a4)
	lea.l	XPlayer_StateDoubleJump(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
