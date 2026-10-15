; ---------------------------------------------------------------------------
; XClone_StateBallsReturn - XCLONE state: when the rolling child stops, shake the screen and roll it back the other way
; In:  8(a6) = this
; Out: d0
; Evidence: g_CamShake := jt[$44AA]; child +$A2 = BioBalls_MotionRoll, +$AA negated, state BioBalls_WaitMotionDone; next XClone_StateWaitChild2
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateBallsReturn:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0974F8
	lea.l	$42AA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	lea.l	$33E2(a5),a0
	move.l	a0,$A2(a3)
	move.w	$AA(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$AA(a3)
	lea.l	$335A(a5),a0
	move.l	a0,$5C(a3)
	clr.w	$6C(a3)
	clr.w	$6C(a4)
	lea.l	XClone_StateWaitChild2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09750A
loc_0974F8:
	clr.w	$6C(a4)
	lea.l	XClone_StateBallsReturn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09750A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
