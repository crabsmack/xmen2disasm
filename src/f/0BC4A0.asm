; ---------------------------------------------------------------------------
; sub_0BC4A0	[jt 1014]
; ---------------------------------------------------------------------------
sub_0BC4A0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($F2).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F2).w
	jsr	$521A(a5)	; -> sub_1FE584
	tst.l	$98(a4)
	lea.l	$10(a7),a7
	bne.s	loc_0BC4E0
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0BC50E
loc_0BC4E0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC4F4
	clr.w	$96(a4)
loc_0BC4F4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0BC50E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
