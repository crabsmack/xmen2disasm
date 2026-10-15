; ---------------------------------------------------------------------------
; XClone_UnlockArena - unlock the clone arena: clear the player flags and the arena camera mode
; In:  8(a6) = clone
; Out: none
; Evidence: when clone +$B0: players +$90 &= ~$200000, -$3894 := 1, g_Camera +$1C := 0, XClone_CamSetNormal, -$3B08 &= ~1, -$3B30 := 0; caller XClone_Kill; TAS 53370-56844
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_UnlockArena:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$B0(a4)
	beq.s	loc_09945E
	clr.b	$B0(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099410
	andi.l	#$FFDFFFFF,-$16C8(a5)
loc_099410:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099430
	andi.l	#$FFDFFFFF,-$17B8(a5)
loc_099430:
	move.b	#$1,-$3894(a5)
	movea.l	g_Camera(a5),a0
	moveq	#$0,d0
	move.l	d0,$1C(a0)
	move.l	g_Camera(a5),-(a7)
	jsr	XClone_CamSetNormal(pc)
	andi.w	#$FFFE,-$3B08(a5)
	moveq	#$0,d0
	move.l	d0,-$3B30(a5)
	jsr	XClone_MakerBufSize(pc)
	move.w	d0,-$3B04(a5)
	addq.w	#$4,a7
loc_09945E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
