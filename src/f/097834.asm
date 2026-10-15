; ---------------------------------------------------------------------------
; sub_097834	[jt 758]
; ---------------------------------------------------------------------------
sub_097834:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$AC(a4),a0
	tst.w	$36(a0)
	beq.s	loc_0978BE
	tst.b	$B7(a4)
	ble.s	loc_097860
	movea.l	a0,a1
	adda.w	$38(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_09787A
loc_097860:
	movea.l	$AC(a4),a0
	move.b	$22(a0),$B7(a4)
	movea.l	a0,a1
	adda.w	$36(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_09787A:
	tst.l	$98(a4)
	bne.s	loc_09788E
	move.l	$64(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_0978FC
loc_09788E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0978A2
	clr.w	$96(a4)
loc_0978A2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_0978FC
loc_0978BE:
	tst.l	$98(a4)
	bne.s	loc_0978D0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0978FC
loc_0978D0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0978E4
	clr.w	$96(a4)
loc_0978E4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0978FC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
