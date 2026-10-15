; ---------------------------------------------------------------------------
; sub_0BCA2C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BCA2C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$B4(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BCA62
	move.w	#$F0,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BCB92(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BCA74
loc_0BCA62:
	clr.w	$6C(a4)
	lea.l	sub_0BCA2C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BCA74:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
