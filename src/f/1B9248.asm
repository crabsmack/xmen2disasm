; ---------------------------------------------------------------------------
; sub_1B9248	[jt 2232]
; ---------------------------------------------------------------------------
sub_1B9248:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_1B9282
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B9290
loc_1B9282:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B9290:
	move.w	#$18,$6E(a4)
	lea.l	$457A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1B9198(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
