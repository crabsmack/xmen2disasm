; ---------------------------------------------------------------------------
; Apocalypse_StateWaitEntrance - APOCALYPSE: when arrived stop sound $79 and motion, angle 180, next script step
; In:  8(a6) = this
; Out: none
; Evidence: +$8C bit 4 clear = arrived; +$8E = $B4; script +$A4 / index +$A2
; ---------------------------------------------------------------------------
Apocalypse_StateWaitEntrance:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$10,d1
	and.w	d0,d1
	bne.s	loc_04B60E
	moveq	#$79,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$B4,$8E(a4)
	tst.l	$A4(a4)
	addq.w	#$4,a7
	bne.s	loc_04B5E2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04B60E
loc_04B5E2:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04B5F6
	clr.w	$A2(a4)
loc_04B5F6:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04B60E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
