; ---------------------------------------------------------------------------
; sub_017C60	[link-after-rts]
; ---------------------------------------------------------------------------
sub_017C60:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_017CA6
	andi.w	#$FFFE,$92(a4)
	moveq	#-$1,d0
	cmp.w	$90(a4),d0
	bne.s	loc_017C90
	lea.l	sub_017BEC(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_017BEC(pc)
	addq.w	#$4,a7
	bra.s	loc_017CE2
loc_017C90:
	move.w	$90(a4),$6C(a4)
	lea.l	sub_017BEC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_017CE2
loc_017CA6:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_017CE2
	ori.w	#$2,$92(a4)
	pea.l	($D9).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D9).w
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	move.w	#$14,$6C(a4)
	lea.l	sub_017CEA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_017CE2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
