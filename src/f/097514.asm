; ---------------------------------------------------------------------------
; XClone_ActBallsRoll - XCLONE script action: roll the BIOBALLS child in the facing direction (speed 10, $5A frames)
; In:  8(a6) = this
; Out: d0
; Evidence: child +$AA = +-10, +$A2 = sub_120124, +$A8 = $5A, state BioBalls_WaitMotionDone; next XClone_StateBallsReturn; jt 752
; Found: jt 752
; ---------------------------------------------------------------------------
XClone_ActBallsRoll:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	beq.s	loc_097570
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_097538
	move.w	#$FFF6,$AA(a3)
	bra.s	loc_09753E
loc_097538:
	move.w	#$A,$AA(a3)
loc_09753E:
	lea.l	$33E2(a5),a0
	move.l	a0,$A2(a3)
	clr.b	$96(a3)
	move.w	#$5A,$A8(a3)
	lea.l	$335A(a5),a0
	move.l	a0,$5C(a3)
	clr.w	$6C(a3)
	clr.w	$6C(a4)
	lea.l	XClone_StateBallsReturn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0975AE
loc_097570:
	tst.l	$98(a4)
	bne.s	loc_097582
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0975AE
loc_097582:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097596
	clr.w	$96(a4)
loc_097596:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0975AE:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
