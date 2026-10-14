; ---------------------------------------------------------------------------
; sub_05C286	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C286:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_05C1F4(pc)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$D2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d7
	moveq	#$20,d0
	sub.l	d0,d7
	moveq	#$13,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4F42(a5)	; -> sub_1F80CA
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$18(a7),a7
	beq.s	loc_05C2E8
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	addq.w	#$8,a7
loc_05C2E8:
	move.w	#$12C,$6E(a4)
	lea.l	sub_05C302(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
