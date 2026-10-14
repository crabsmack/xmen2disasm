; ---------------------------------------------------------------------------
; sub_122DBE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_122DBE:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	ori.w	#$8,$A2(a4)
	move.l	a3,d0
	beq.s	loc_122DE2
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_121D94(pc)
	addq.w	#$8,a7
loc_122DE2:
	move.w	#$FFE5,$1E(a4)
	move.w	#$5BE,$16(a4)
	clr.w	$20(a4)
	move.w	#$FBE0,$18(a4)
	move.w	#$1500,$22(a4)
	move.w	#$1500,$24(a4)
	move.w	#$C8,$6E(a4)
	clr.w	$A0(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
