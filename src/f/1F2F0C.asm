; ---------------------------------------------------------------------------
; sub_1F2F0C	[jt 2455]
; ---------------------------------------------------------------------------
sub_1F2F0C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F2F48
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
loc_1F2F48:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F2F66
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F2F74
loc_1F2F66:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F2F74:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$22(a0),d0
	move.w	d0,$6E(a4)
	movea.l	a0,a1
	adda.w	$36(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1F2E56(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
