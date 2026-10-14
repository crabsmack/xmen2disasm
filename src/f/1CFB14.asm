; ---------------------------------------------------------------------------
; sub_1CFB14	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFB14:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CFB3A
	lea.l	sub_1CFA90(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFA90(pc)
	addq.w	#$4,a7
	bra.s	loc_1CFB4E
loc_1CFB3A:
	move.w	#$5,$6C(a4)
	lea.l	sub_1CFAD8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CFB4E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
