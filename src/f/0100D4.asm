; ---------------------------------------------------------------------------
; sub_0100D4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0100D4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($EE).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EE).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	addq.w	#$8,a7
	bge.s	loc_0100FE
	ori.b	#$10,$2E(a4)
loc_0100FE:
	move.w	$8C(a4),d0
	beq.s	loc_01010C
	subi.w	#$B4,d0
	beq.s	loc_010118
	bra.s	loc_010118
loc_01010C:
	move.w	#$1000,$16(a4)
	clr.w	$18(a4)
	bra.s	loc_010122
loc_010118:
	move.w	#$F000,$16(a4)
	clr.w	$18(a4)
loc_010122:
	lea.l	$1E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_01014C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
