; ---------------------------------------------------------------------------
; sub_142A22	[link-after-rts]
; ---------------------------------------------------------------------------
sub_142A22:
	link.w	a6,#$FFFE
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$2(a6)
	move.l	a4,-(a7)
	jsr	sub_14278E(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_142A7A
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$44,d0
	cmp.w	-$2(a6),d0
	addq.w	#$8,a7
	bge.s	loc_142A68
	clr.w	$6C(a4)
	lea.l	sub_1429A6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_142A7A
loc_142A68:
	clr.w	$6C(a4)
	lea.l	sub_1425A0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_142A7A:
	movea.l	-$6(a6),a4
	unlk	a6
	rts
