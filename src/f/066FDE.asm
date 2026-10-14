; ---------------------------------------------------------------------------
; sub_066FDE	[jt 471]
; ---------------------------------------------------------------------------
sub_066FDE:
	link.w	a6,#$0
	clr.w	-$3B0C(a5)
	clr.w	-$3B0A(a5)
	lea.l	$FC2(a5),a0
	move.l	$2(a0),-$3B14(a5)
	move.w	#$4000,d0
	and.w	-$3C5E(a5),d0
	bne.s	loc_067010
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
loc_067010:
	jsr	sub_066B26(pc)
	jsr	$32(a5)	; -> sub_005C7C
	clr.w	-$3C5E(a5)
	unlk	a6
	rts
