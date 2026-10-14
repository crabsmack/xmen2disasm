; ---------------------------------------------------------------------------
; sub_136CCA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136CCA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$37CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	moveq	#-$1,d0
	cmp.w	$A2(a4),d0
	addq.w	#$8,a7
	bne.s	loc_136CFE
	lea.l	sub_136BD4(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_136BD4(pc)
	addq.w	#$4,a7
	bra.s	loc_136D12
loc_136CFE:
	move.w	$A2(a4),$6C(a4)
	lea.l	sub_136BD4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136D12:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
