; ---------------------------------------------------------------------------
; XClone_StateEmerge - XCLONE entrance: when the pod is done, remove it, make the clone hittable and start its script
; In:  8(a6) = this
; Out: d0
; Evidence: pod slot +$52 Kill; +6 &= ~2, sub_15DF2A(this, $FFEBAE) -> +$84; animation record + word 4; script step 0; 2 callers
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateEmerge:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_0962B8
	move.l	$9C(a4),-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_0962A2
	clr.w	$6C(a4)
	lea.l	XClone_StateEmerge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_096310
loc_0962A2:
	movea.l	$9C(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	addq.w	#$4,a7
loc_0962B8:
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	lea.l	$10(a7),a7
	bne.s	loc_0962F4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096310
loc_0962F4:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096310:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
