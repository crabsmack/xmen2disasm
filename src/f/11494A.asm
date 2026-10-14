; ---------------------------------------------------------------------------
; sub_11494A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11494A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$12(a4)
	move.l	a4,-(a7)
	jsr	sub_1148B2(pc)
	lea.l	sub_11497C(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_11497C(pc)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
