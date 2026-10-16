; ---------------------------------------------------------------------------
; XClone_ActBallsCollapse - XCLONE script action: collapse the BIOBALLS child onto the floor (animation Tbl_XCloneBallsCollapsePath (jt $1A12)), then wait for it
; In:  8(a6) = this
; Out: d0
; Evidence: BioBalls_FillFromFirst, BioBalls_StartPath(child, Tbl_XCloneBallsCollapsePath (jt $1A12), 0, 0, 0), child y = floor, state BioBalls_ActClearAnim; next XClone_StateWaitChild; jt 753
; Found: jt 753
; ---------------------------------------------------------------------------
XClone_ActBallsCollapse:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$9C(a3),a4
	move.l	a4,d0
	beq.s	loc_097638
	move.l	a4,-(a7)
	jsr	$33AA(a5)	; -> BioBalls_FillFromFirst
	moveq	#$10,d0
	and.b	$2E(a3),d0
	addq.w	#$4,a7
	bne.s	loc_0975E4
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0975EA
loc_0975E4:
	ori.b	#$10,$2E(a4)
loc_0975EA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$1A12(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$339A(a5)	; -> BioBalls_StartPath
	moveq	#$0,d0
	move.l	d0,$A2(a4)
	move.w	$A6(a3),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,$C(a4)
	clr.b	$96(a4)
	lea.l	$3362(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	lea.l	$14(a7),a7
	clr.w	$6C(a3)
	lea.l	XClone_StateWaitChild(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_097638:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
