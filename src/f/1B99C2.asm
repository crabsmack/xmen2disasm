; ---------------------------------------------------------------------------
; sub_1B99C2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B99C2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B99E2
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1B99EA
loc_1B99E2:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1B99EA:
	beq.s	loc_1B9A60
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$11,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	#$10000,d0
	and.l	$90(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9A18
	move.l	#$FFFFF7CC,d0
	bra.s	loc_1B9A1A
loc_1B9A18:
	moveq	#$0,d0
loc_1B9A1A:
	move.w	d0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$E(a0),$20(a4)
	clr.b	g_CamModeSwitched(a5)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1B9AF8
loc_1B9A60:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9A74
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B9A7C
loc_1B9A74:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B9A7C:
	beq.s	loc_1B9AD6
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8C(a4),a0
	move.b	$4(a0),$70(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9AA8
	moveq	#$A,d0
	bra.s	loc_1B9AAA
loc_1B9AA8:
	moveq	#$9,d0
loc_1B9AAA:
	move.b	d0,$71(a4)
	lea.l	$45C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1B99C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1B9AF8
loc_1B9AD6:
	lea.l	$45BA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1B99C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B9AF8:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
