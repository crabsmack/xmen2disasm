; ---------------------------------------------------------------------------
; sub_139108	[link-after-rts]
; ---------------------------------------------------------------------------
sub_139108:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$396A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.w	$9E(a4),$6E(a4)
	tst.b	$A7(a4)
	addq.w	#$8,a7
	bne.s	loc_139142
	clr.w	$6C(a4)
	lea.l	sub_138F1E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13915A
loc_139142:
	move.w	$9A(a4),$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1390BA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13915A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
