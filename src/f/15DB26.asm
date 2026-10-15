; ---------------------------------------------------------------------------
; sub_15DB26	[jt 2049]
; ---------------------------------------------------------------------------
sub_15DB26:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$C(a6),a4
	move.w	$6(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	-$35A6(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_15DB56
	move.w	-$35A8(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_15DB5A
loc_15DB56:
	moveq	#$0,d0
	bra.s	loc_15DB84
loc_15DB5A:
	move.w	$8(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	-$35A4(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_15DB7E
	move.w	-$35AA(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_15DB82
loc_15DB7E:
	moveq	#$0,d0
	bra.s	loc_15DB84
loc_15DB82:
	moveq	#$1,d0
loc_15DB84:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
