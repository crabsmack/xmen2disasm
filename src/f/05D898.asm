; ---------------------------------------------------------------------------
; sub_05D898	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05D898:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.w	#$28,$1E(a4)
	move.w	$9A(a4),d0
	asr.w	#$2,d0
	move.w	d0,$16(a4)
	move.w	$9A(a4),$22(a4)
	andi.w	#$BFFF,$6(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_05D8E8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
