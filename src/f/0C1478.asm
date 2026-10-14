; ---------------------------------------------------------------------------
; sub_0C1478	[jt 1121]
; ---------------------------------------------------------------------------
sub_0C1478:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	jsr	$5242(a5)	; -> sub_1FE5F2
	jsr	sub_0C1412(pc)
	move.w	d7,-$38D2(a5)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> sub_1FE630
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.l	-$4(a6),d7
	unlk	a6
	rts
