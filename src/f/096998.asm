; ---------------------------------------------------------------------------
; sub_096998	[jt 741]
; ---------------------------------------------------------------------------
sub_096998:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	beq.s	loc_096A1A
	pea.l	($EF).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($EF).w
	jsr	$521A(a5)	; -> sub_1FE584
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_0969CE
	andi.b	#$EF,$2E(a3)
	bra.s	loc_0969D4
loc_0969CE:
	ori.b	#$10,$2E(a3)
loc_0969D4:
	move.l	$8(a3),$8(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$6(a1),a0
	move.l	a0,-(a7)
	move.l	a3,-(a7)
	jsr	$339A(a5)	; -> sub_11F3E2
	moveq	#$0,d0
	move.l	d0,$A2(a3)
	move.w	$A6(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,$C(a3)
	clr.b	$96(a3)
	lea.l	$3372(a5),a0
	move.l	a0,$5C(a3)
	clr.w	$6C(a3)
	lea.l	$14(a7),a7
loc_096A1A:
	clr.w	$6C(a4)
	lea.l	sub_095968(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
