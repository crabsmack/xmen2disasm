; ---------------------------------------------------------------------------
; sub_0884E6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0884E6:
	link.w	a6,#$0
	moveq	#$20,d0
	and.w	-$3B0C(a5),d0
	bne.s	loc_08850A
	ori.w	#$20,-$3B0C(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	sub_088588(pc)
	jsr	$3F3A(a5)	; -> sub_15B0E6
	jsr	sub_088600(pc)
	addq.w	#$8,a7
loc_08850A:
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	sub_088422(pc)
	tst.b	-$3C4A(a5)
	beq.s	loc_088526
	movea.l	-$3B18(a5),a0
	move.b	-$3C4A(a5),$4(a0)
loc_088526:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_08854E
	tst.b	-$3C4A(a5)
	beq.s	loc_08854E
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	-$3B18(a5),-(a7)
	pea.l	-$3C54(a5)
	pea.l	-$3C52(a5)
	pea.l	-$3C50(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	lea.l	$14(a7),a7
loc_08854E:
	tst.b	-$38DE(a5)
	beq.s	loc_088584
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	sub_088422(pc)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_088584
	tst.b	-$3C4A(a5)
	beq.s	loc_088584
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	-$3B18(a5),-(a7)
	pea.l	-$3C54(a5)
	pea.l	-$3C52(a5)
	pea.l	-$3C50(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
loc_088584:
	unlk	a6
	rts
