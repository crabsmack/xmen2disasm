; ---------------------------------------------------------------------------
; sub_136B84	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136B84:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_136BAC
	ori.b	#$10,$2E(a4)
	bra.s	loc_136BB2
loc_136BAC:
	andi.b	#$EF,$2E(a4)
loc_136BB2:
	move.w	$A4(a4),$A8(a4)
	clr.w	$6C(a4)
	lea.l	sub_136BD4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
