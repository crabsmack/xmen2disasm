; ---------------------------------------------------------------------------
; sub_04C168	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C168:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_04C188
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_04C188:
	move.w	d7,$16(a4)
	move.w	#$300,$18(a4)
	lea.l	$9DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($E8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E8).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_04C1D0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
