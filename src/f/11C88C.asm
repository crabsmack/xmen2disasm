; ---------------------------------------------------------------------------
; sub_11C88C	[jt 1574]
; ---------------------------------------------------------------------------
sub_11C88C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A8(a4)
	beq.s	loc_11C8B2
	movea.l	$A8(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11C8B2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$2FC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_11C8E2
	move.l	$64(a4),$5C(a4)
	move.w	#$8,$6C(a4)
	bra.s	loc_11C910
loc_11C8E2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11C8F6
	clr.w	$96(a4)
loc_11C8F6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$8,$6C(a4)
loc_11C910:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
