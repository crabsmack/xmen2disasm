; ---------------------------------------------------------------------------
; sub_03605C	[jt 238]
; ---------------------------------------------------------------------------
sub_03605C:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$E(a6),d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$822(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3CAC(a5)
	move.w	d7,-$3CAE(a5)
	pea.l	$360A4(pc)
	pea.l	($800).w
	jsr	$5032(a5)	; -> sub_1FA8DC
	ext.l	d7
	movea.l	-$10F4(a5),a0
	move.l	d7,d1
	asl.l	#$2,d1
	move.l	d0,(a0,d1.l)
	lea.l	$10(a7),a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
