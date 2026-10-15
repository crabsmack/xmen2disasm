; ---------------------------------------------------------------------------
; sub_138CD6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_138CD6:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	slt.b	d3
	neg.b	d3
	move.b	d3,d7
	beq.s	loc_138D06
	move.l	$8(a4),d0
	sub.l	#$1300,d0
	bra.s	loc_138D10
loc_138D06:
	move.l	$8(a4),d0
	add.l	#$1300,d0
loc_138D10:
	move.l	d0,d6
	tst.w	$A4(a4)
	addq.w	#$4,a7
	bne.s	loc_138D2E
	clr.w	$6C(a4)
	lea.l	sub_139108(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_138D9E
loc_138D2E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$2F00,d1
	move.l	d1,-(a7)
	move.l	d6,-(a7)
	lea.l	$395A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$395A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_138D94
	pea.l	($D2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D2).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_138D7E
	moveq	#$1,d0
	bra.s	loc_138D80
loc_138D7E:
	moveq	#$0,d0
loc_138D80:
	addq.w	#$8,a7
	beq.s	loc_138D8A
	ori.b	#$4,$2E(a3)
loc_138D8A:
	tst.b	d7
	beq.s	loc_138D94
	ori.b	#$10,$2E(a3)
loc_138D94:
	move.w	$A2(a4),$6C(a4)
	subq.w	#$1,$A4(a4)
loc_138D9E:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
