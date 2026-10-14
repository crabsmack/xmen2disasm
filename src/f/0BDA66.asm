; ---------------------------------------------------------------------------
; sub_0BDA66	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDA66:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($3E8).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	moveq	#$14,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> sub_15A8FE
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0BD6E2(pc)
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0BDAC4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
