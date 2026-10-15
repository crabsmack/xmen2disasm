; ---------------------------------------------------------------------------
; sub_05C8F4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C8F4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	move.b	#$13,$9A(a4)
	lea.l	sub_05C92A(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$15,$6C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
