; ---------------------------------------------------------------------------
; sub_11286E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11286E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	-$35A2(a5),-(a7)
	pea.l	-$3940(a5)
	jsr	$4DAA(a5)	; -> sub_1F48AA
	move.b	#$1,-$3A06(a5)
	lea.l	$C(a7),a7
	move.w	#$2,$6C(a4)
	lea.l	sub_11286E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
