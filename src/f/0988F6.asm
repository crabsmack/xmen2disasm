; ---------------------------------------------------------------------------
; sub_0988F6	[jt 783]
; ---------------------------------------------------------------------------
sub_0988F6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$4,a7
	bne.s	loc_09894E
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09894E
	lea.l	-$1758(a5),a0
	cmpa.l	a3,a0
	bne.s	loc_09894A
	lea.l	-$1848(a5),a3
	bra.s	loc_09894E
loc_09894A:
	lea.l	-$1758(a5),a3
loc_09894E:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,$BA(a4)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,$BC(a4)
	lea.l	$44A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_098830(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
