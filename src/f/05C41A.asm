; ---------------------------------------------------------------------------
; sub_05C41A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C41A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,d6
	sub.l	#$A0,d6
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$70,d0
	sub.l	d0,d7
	move.w	d6,d1
	sub.w	#$32,d1
	move.w	d1,-$3A98(a5)
	move.w	d6,d1
	add.w	#$32,d1
	move.w	d1,-$3A96(a5)
	move.w	d7,-$3A9C(a5)
	move.w	d7,-$3A9A(a5)
	move.l	a4,-(a7)
	jsr	sub_05C204(pc)
	jsr	$5242(a5)	; -> sub_1FE5F2
	moveq	#$23,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$23,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	pea.l	g_Player1(a5)
	jsr	sub_05C22E(pc)
	pea.l	g_Player2(a5)
	jsr	sub_05C22E(pc)
	move.w	#$64,$6E(a4)
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
