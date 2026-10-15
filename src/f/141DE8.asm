; ---------------------------------------------------------------------------
; sub_141DE8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_141DE8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.w	loc_141ED4
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$180,d0
	move.w	$4E(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	blt.w	loc_141E94
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$40,d1
	sub.l	d1,d0
	move.w	$52(a4),d2
	ext.l	d2
	cmp.l	d2,d0
	bgt.s	loc_141E94
	lea.l	$3C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_141E46
	move.w	$9E(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_141E4C
loc_141E46:
	move.w	$9E(a4),d0
	ext.l	d0
loc_141E4C:
	move.w	d0,$16(a4)
	lea.l	$3C7A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$94(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$96(a4)
	lea.l	$10(a7),a7
	bne.s	loc_141E76
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141EE6
loc_141E76:
	clr.w	$94(a4)
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141EE6
loc_141E94:
	tst.l	$96(a4)
	bne.s	loc_141EA6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141EE6
loc_141EA6:
	addq.w	#$1,$94(a4)
	movea.l	$96(a4),a0
	move.w	$94(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_141EBA
	clr.w	$94(a4)
loc_141EBA:
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_141EE6
loc_141ED4:
	clr.w	$6C(a4)
	lea.l	sub_141DE8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_141EE6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
