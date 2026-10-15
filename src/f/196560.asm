; ---------------------------------------------------------------------------
; Wolverine_SetAirFrame - WOLVERINE slot +$7E: pick the jump frame from the vertical speed
; In:  8(a6) = player
; Out: none
; Evidence: vy bands -$280/$280/$300 -> SetFrame $31/$32/$33/$34
; ---------------------------------------------------------------------------
Wolverine_SetAirFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	cmpi.w	#$FD80,d7
	bge.s	loc_196588
	moveq	#$31,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1965C8
loc_196588:
	cmpi.w	#$280,d7
	bge.s	loc_1965A0
	moveq	#$32,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1965C8
loc_1965A0:
	cmpi.w	#$300,d7
	bge.s	loc_1965B8
	moveq	#$33,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1965C8
loc_1965B8:
	moveq	#$34,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1965C8:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
