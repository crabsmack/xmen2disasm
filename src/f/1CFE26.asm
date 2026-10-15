; ---------------------------------------------------------------------------
; sub_1CFE26	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFE26:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFE46
	move.w	-$3B9E(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFE4E
loc_1CFE46:
	move.w	-$3B9E(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFE4E:
	beq.s	loc_1CFEC2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFE64
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFE6C
loc_1CFE64:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFE6C:
	beq.s	loc_1CFE98
	lea.l	$48BA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$6,$C2(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFB14(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1CFF74
loc_1CFE98:
	lea.l	$48B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$5,$C2(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFB14(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1CFF74
loc_1CFEC2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFED6
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFEDE
loc_1CFED6:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFEDE:
	beq.s	loc_1CFF4E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFEF4
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFEFC
loc_1CFEF4:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFEFC:
	beq.s	loc_1CFF26
	lea.l	$48CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$8,$C2(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFB14(pc)
	lea.l	$C(a7),a7
	bra.s	loc_1CFF74
loc_1CFF26:
	lea.l	$48D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$9,$C2(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFB14(pc)
	lea.l	$C(a7),a7
	bra.s	loc_1CFF74
loc_1CFF4E:
	lea.l	$48C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$7,$C2(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFB14(pc)
	lea.l	$C(a7),a7
loc_1CFF74:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
