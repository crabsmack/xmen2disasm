; ---------------------------------------------------------------------------
; sub_022B2E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_022B2E:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_022B48
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> sub_1F944E
	moveq	#$1,d0
	addq.w	#$4,a7
	bra.s	loc_022B4A
loc_022B48:
	moveq	#$0,d0
loc_022B4A:
	unlk	a6
	rts
