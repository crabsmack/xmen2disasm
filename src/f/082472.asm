; ---------------------------------------------------------------------------
; sub_082472	[link-after-rts]
; ---------------------------------------------------------------------------
sub_082472:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4E(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	cmpi.l	#$110,d0
	bgt.s	loc_082500
	move.w	$52(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#$30,d1
	cmp.l	d0,d1
	bgt.s	loc_082500
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	cmpi.l	#$E0,d0
	bgt.s	loc_082500
	move.w	$50(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	blt.s	loc_082500
	ori.w	#$1000,$6(a4)
	moveq	#-$1,d0
	cmp.w	$8E(a4),d0
	bne.s	loc_0824EC
	lea.l	sub_082508(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_082508(pc)
	addq.w	#$4,a7
	bra.s	loc_082500
loc_0824EC:
	move.w	$8E(a4),$6C(a4)
	lea.l	sub_082508(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_082500:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
