; ---------------------------------------------------------------------------
; loc_047586
; ---------------------------------------------------------------------------
loc_047586:
	lea.l	$982(a5),a0
	movea.l	$2(a0),a4
	move.w	-$3B3A(a5),d0
	ext.l	d0
	add.l	d0,d0
	adda.l	d0,a4
	moveq	#$C,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	-$392C(a5)
	jsr	$4DAA(a5)	; -> Mem_Copy
	lea.l	$C(a7),a7
loc_0475AA:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
