; ---------------------------------------------------------------------------
; XClone_Kill - vtable +$52: kill the child, count the clone (-$3C40, not for type 4 Magneto), end the clone wave after 6
; Evidence: Clone_CharTypeOf(this) != 4 -> -$3C40 += 1; +$B0 set -> XClone_UnlockArena; -$3C40 > 5 -> XClone_EndWave; then BIONPC Kill; TAS 52535-56844
; ---------------------------------------------------------------------------
XClone_Kill:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_095534
	movea.l	$9C(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	addq.w	#$4,a7
loc_095534:
	move.l	a4,-(a7)
	jsr	Clone_CharTypeOf(pc)
	move.w	d0,d7
	cmpi.w	#$4,d7
	addq.w	#$4,a7
	beq.s	loc_09554C
	move.w	-$3C40(a5),d0
	addq.w	#$1,-$3C40(a5)
loc_09554C:
	tst.b	$B0(a4)
	beq.s	loc_09555A
	move.l	a4,-(a7)
	jsr	XClone_UnlockArena(pc)
	addq.w	#$4,a7
loc_09555A:
	moveq	#$6,d0
	cmp.w	-$3C40(a5),d0
	bgt.s	loc_095566
	jsr	XClone_EndWave(pc)
loc_095566:
	move.l	a4,-(a7)
	lea.l	$1902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
