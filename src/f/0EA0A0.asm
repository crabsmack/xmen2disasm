; ---------------------------------------------------------------------------
; sub_0EA0A0	[jt 1255]
; ---------------------------------------------------------------------------
sub_0EA0A0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($D0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D0).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$2812(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$8E(a4)
	bne.s	loc_0EA0DC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0EA0F8
loc_0EA0DC:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0EA0F8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
