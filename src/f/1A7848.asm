; ---------------------------------------------------------------------------
; sub_1A7848	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A7848:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_PalFadeActive(a5)
	beq.s	loc_1A785E
	moveq	#$1,d7
	bra.s	loc_1A787A
loc_1A785E:
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$44BA(a5)	; -> sub_1A60B6
	move.b	d0,d7
	moveq	#$0,d0
	move.b	-$38DE(a5),d0
	addq.w	#$1,d0
	add.w	d0,$12(a4)
	addq.w	#$4,a7
loc_1A787A:
	tst.b	d7
	beq.s	loc_1A78B2
	move.b	#$1,g_PalBaseDirty(a5)
	tst.l	$44(a4)
	beq.s	loc_1A78A0
	move.w	#$FF,$6C(a4)
	lea.l	sub_1A77F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A78B2
loc_1A78A0:
	clr.w	$6C(a4)
	lea.l	sub_1A77F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A78B2:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
