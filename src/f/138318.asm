; ---------------------------------------------------------------------------
; sub_138318	[link-after-rts]
; ---------------------------------------------------------------------------
sub_138318:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> sub_1F6A32
	move.l	d0,$94(a4)
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_13834E
	move.w	#$3C,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_138358(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13834E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
