; ---------------------------------------------------------------------------
; sub_098A66	[jt 786]
; ---------------------------------------------------------------------------
sub_098A66:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_098A80
	move.l	#$FFFFF8A0,d0
	bra.s	loc_098A86
loc_098A80:
	move.l	#$760,d0
loc_098A86:
	move.w	d0,$16(a4)
	asr.w	#$5,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$1E(a4)
	pea.l	($C0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($C0).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$456A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_098A0A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
