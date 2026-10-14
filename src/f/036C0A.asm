; ---------------------------------------------------------------------------
; sub_036C0A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036C0A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$FFFFD800,$8(a4)
	move.l	#$11800,$C(a4)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	($B0).w
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	jsr	$72A(a5)	; -> sub_0358D8
	lea.l	$14(a7),a7
	move.w	#$3C,$6C(a4)
	lea.l	sub_036C58(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
