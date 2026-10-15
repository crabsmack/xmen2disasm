; ---------------------------------------------------------------------------
; sub_067936	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067936:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.l	a4,-(a7)
	jsr	PlayerSelect_RevertCursor(pc)
	clr.b	$32(a4)
	clr.b	$34(a4)
	move.b	#$1,$35(a4)
	move.w	#$1E,$2E(a4)
	move.w	#$A,$3A(a4)
	addq.w	#$4,a7
	clr.w	$6C(a3)
	lea.l	sub_067984(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
