; ---------------------------------------------------------------------------
; sub_017D60	[link-after-rts]
; ---------------------------------------------------------------------------
sub_017D60:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_017DD2
	lea.l	$A4(a4),a3
	move.l	(a3),d6
	move.l	$4(a3),d7
	andi.w	#$FFF8,$92(a4)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DDA(a5)	; -> sub_1181AC
	moveq	#-$1,d0
	cmp.w	$90(a4),d0
	lea.l	$14(a7),a7
	bne.s	loc_017DBE
	lea.l	sub_017BEC(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_017BEC(pc)
	addq.w	#$4,a7
	bra.s	loc_017DD2
loc_017DBE:
	move.w	$90(a4),$6C(a4)
	lea.l	sub_017BEC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_017DD2:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
