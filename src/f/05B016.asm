; ---------------------------------------------------------------------------
; Boulder_InitDebrisPool - set up the pool of 30 rock-debris records ($14 bytes) and empty it
; In:  8(a6) = buffer
; Out: d0
; Evidence: -$3C68 = buffer, -$3C64 = count 0
; ---------------------------------------------------------------------------
Boulder_InitDebrisPool:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	-$3C64(a5)
	move.l	a4,-$3C68(a5)
	clr.w	d7
	moveq	#$1E,d3
loc_05B02E:
	moveq	#$0,d0
	move.l	d0,(a4)
	move.l	d0,$4(a4)
	clr.l	$8(a4)
	clr.l	$C(a4)
	move.l	d0,$10(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$14(a4),a4
	cmp.w	d7,d3
	bgt.s	loc_05B02E
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
