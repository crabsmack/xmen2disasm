; ---------------------------------------------------------------------------
; sub_0821E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0821E8:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	moveq	#$1,d4
	clr.b	d5
	movea.l	-$1860(a5),a0
	move.w	$2(a0),d7
	move.w	$4(a0),d6
	andi.w	#$FE00,d7
	jsr	sub_08206A(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0820AE(pc)
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	d4,d0
	move.l	d0,-(a7)
	pea.l	($3E8).w
	pea.l	($3E8).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
