; ---------------------------------------------------------------------------
; sub_0BBE0C	[jt 1007]
; ---------------------------------------------------------------------------
sub_0BBE0C:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	$9E(a4),d0
	cmp.w	$A0(a4),d0
	addq.w	#$4,a7
	bne.s	loc_0BBE8C
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BBE5A
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBF44
loc_0BBE5A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BBE6E
	clr.w	$96(a4)
loc_0BBE6E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBF44
loc_0BBE8C:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$9E(a4),d7
	bne.s	loc_0BBEAA
	addi.l	#$100,$8(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BBEBE
loc_0BBEAA:
	cmp.w	$A0(a4),d7
	bne.s	loc_0BBEBE
	subi.l	#$100,$8(a4)
	ori.b	#$10,$2E(a4)
loc_0BBEBE:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBECE
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BBED4
loc_0BBECE:
	move.l	#$220,d0
loc_0BBED4:
	move.w	d0,$16(a4)
	pea.l	($EA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EA).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	d6,$A8(a4)
	cmp.w	$A8(a4),d7
	addq.w	#$8,a7
	bge.s	loc_0BBEFC
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BBF02
loc_0BBEFC:
	ori.b	#$10,$2E(a4)
loc_0BBF02:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBF12
	move.l	#$FFFFFF7E,d0
	bra.s	loc_0BBF18
loc_0BBF12:
	move.l	#$82,d0
loc_0BBF18:
	add.w	d6,d0
	move.w	d0,$AA(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBF2A
	moveq	#-$56,d0
	bra.s	loc_0BBF2C
loc_0BBF2A:
	moveq	#$56,d0
loc_0BBF2C:
	ext.w	d0
	move.w	d0,$1E(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BC0C4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BBF44:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
