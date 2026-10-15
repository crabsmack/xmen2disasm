; ---------------------------------------------------------------------------
; sub_077256	[convert.py]
; ---------------------------------------------------------------------------
sub_077256:
	move.l	g_VBlankCount(a5),d1
	btst	#$0,d1
	bne.s	loc_0772B4
	lea.l	$109A(a5),a0
	movea.l	$2(a0),a0
	lea.l	$410(a0),a0
	move.w	-$3B10(a5),d0
	lsl.w	#$5,d0
	addi.w	#$380,d0
	pea.l	($E0).w
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	lea.l	$10A2(a5),a0
	movea.l	$2(a0),a0
	lea.l	$CC(a0),a0
	move.w	-$3AAE(a5),d0
	lsl.w	#$5,d0
	pea.l	($600).w
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	move.w	-$3B10(a5),d0
	lsl.w	#$5,d0
	move.w	#$380,d1
	bra.s	loc_077306
loc_0772B4:
	lea.l	$109A(a5),a0
	movea.l	$2(a0),a0
	lea.l	$90(a0),a0
	move.w	-$3B10(a5),d0
	lsl.w	#$5,d0
	pea.l	($380).w
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	lea.l	$10A2(a5),a0
	movea.l	$2(a0),a0
	lea.l	$6CC(a0),a0
	move.w	-$3AAE(a5),d0
	lsl.w	#$5,d0
	pea.l	($600).w
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	move.w	-$3B10(a5),d0
	lsl.w	#$5,d0
	addi.w	#$380,d0
	move.w	#$E0,d1
loc_077306:
	lsl.l	#$2,d0
	lsr.w	#$2,d0
	ori.l	#$804000,d0
	swap	d0
	move.l	d0,-(a7)
	move.w	g_VdpReg1(a5),d0
	ori.w	#$10,d0
	move.w	d0,($C00004).l
	move.w	#$8F01,($C00004).l
	subq.w	#$1,d1
	move.w	#$9300,d0
	move.b	d1,d0
	move.w	d0,($C00004).l
	move.b	#$94,d1
	rol.w	#$8,d1
	move.w	d1,($C00004).l
	move.w	#$9780,($C00004).l
	move.w	(a7)+,($C00004).l
	move.w	(a7)+,($C00004).l
	move.b	#$0,($C00000).l
	moveq	#$2,d0
loc_077362:
	and.w	($C00004).l,d0
	bne.s	loc_077362
	move.w	g_VdpReg1(a5),($C00004).l
	move.w	#$8F02,($C00004).l
	rts
