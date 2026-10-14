; ---------------------------------------------------------------------------
; sub_01C94A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_01C94A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	lsl.l	#$7,d6
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	lsl.l	#$7,d7
	pea.l	($DB).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	clr.w	$B4(a4)
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
