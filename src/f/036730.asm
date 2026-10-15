; ---------------------------------------------------------------------------
; sub_036730	[jt 243]
; ---------------------------------------------------------------------------
sub_036730:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	movea.l	$8(a6),a4
	move.w	#$1E,$6A(a4)
	ext.w	d6
	sub.w	d6,$68(a4)
	moveq	#$A,d0
	cmp.w	$68(a4),d0
	ble.s	loc_03675A
	move.w	#$A,$68(a4)
loc_03675A:
	moveq	#$0,d0
	move.b	$B2(a4),d0
	cmpi.w	#$4,d0
	bne.s	loc_03678A
	ext.w	d6
	ext.l	d6
	move.l	d6,d7
	lsl.l	#$4,d7
	move.b	$13(a6),d0
	subi.b	#$9,d0
	beq.s	loc_03677E
	subq.b	#$1,d0
	beq.s	loc_036786
	bra.s	loc_03678A
loc_03677E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_036786:
	add.w	d7,$A2(a4)
loc_03678A:
	moveq	#$7D,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$7D,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$73A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	lea.l	$10(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
