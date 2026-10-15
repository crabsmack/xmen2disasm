; ---------------------------------------------------------------------------
; sub_097904	[link-after-rts]
; ---------------------------------------------------------------------------
sub_097904:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	moveq	#$1,d7
	cmp.w	$A2(a4),d6
	bne.s	loc_097926
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_097934
loc_097926:
	cmp.w	$A0(a4),d6
	bne.s	loc_097938
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_097938
loc_097934:
	clr.b	d7
	bra.s	loc_097968
loc_097938:
	movea.l	$AC(a4),a0
	movea.l	a0,a1
	adda.w	$3E(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_09795C
	move.w	$B2(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_097962
loc_09795C:
	move.w	$B2(a4),d0
	ext.l	d0
loc_097962:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
loc_097968:
	move.b	d7,d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
