; ---------------------------------------------------------------------------
; sub_085F0A	[jt 614]
; ---------------------------------------------------------------------------
sub_085F0A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d7
	sub.w	g_CameraX(a5),d7
	cmpi.w	#$160,d7
	bgt.s	loc_085F78
	move.w	$6(a4),d6
	sub.w	g_CameraY(a5),d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	$16(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	ext.l	d6
	move.l	d6,d0
	moveq	#-$4,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	moveq	#$1C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	$32(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	ext.l	d6
	move.l	d6,d0
	moveq	#-$4,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	moveq	#$3A,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	$4E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$24(a7),a7
loc_085F78:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
