; ---------------------------------------------------------------------------
; sub_086C02	[link-after-rts]
; ---------------------------------------------------------------------------
sub_086C02:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	moveq	#$0,d0
	move.l	d0,-$3C44(a5)
	addq.w	#$8,a7
	move.w	#$78,$6C(a4)
	lea.l	sub_086C3E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
