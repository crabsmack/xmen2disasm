; ---------------------------------------------------------------------------
; sub_106E14	[jt 1341]
; ---------------------------------------------------------------------------
sub_106E14:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$76(a0),a4
	move.w	$8(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d4
	sub.l	d1,d4
	move.w	$A(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$C(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$E(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	d4,d6
	bge.s	loc_106E72
	move.w	d4,-$2(a6)
	move.w	d6,d4
	move.w	-$2(a6),d6
loc_106E72:
	cmp.w	d5,d7
	bge.s	loc_106E80
	move.w	d5,-$2(a6)
	move.w	d7,d5
	move.w	-$2(a6),d7
loc_106E80:
	moveq	#$0,d3
	cmp.w	-$35BA(a5),d4
	bgt.s	loc_106E9C
	cmp.w	-$35B8(a5),d6
	blt.s	loc_106E9C
	cmp.w	-$35BE(a5),d5
	bgt.s	loc_106E9C
	cmp.w	-$35BC(a5),d7
	blt.s	loc_106E9C
	moveq	#$1,d3
loc_106E9C:
	move.b	d3,d0
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
