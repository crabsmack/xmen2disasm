; ---------------------------------------------------------------------------
; sub_0BD128	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BD128:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a3),-(a7)
	move.l	$8(a3),-(a7)
	lea.l	$33F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_0BD1C2
	lea.l	$1E9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3392(a5)	; -> sub_11F2F2
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$1E7A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$8E(a4)
	lea.l	$18(a7),a7
	bne.s	loc_0BD1A6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BD1C2
loc_0BD1A6:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BD1C2:
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
