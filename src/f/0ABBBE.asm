; ---------------------------------------------------------------------------
; FloatBubble_OutsideActiveWindow - vtable +$42: is a FLOATBUBBLE outside its active window
; In:  8(a6) = this
; Evidence: slot +$42 of the FLOATBUBBLE descriptor $0AB496; TAS frames 29721-31626 (299 frames active)
; ---------------------------------------------------------------------------
FloatBubble_OutsideActiveWindow:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.l	#$13A,d7
	ble.s	loc_0ABBE6
	moveq	#$1,d0
	bra.s	loc_0ABC1C
loc_0ABBE6:
	moveq	#-$10,d0
	cmp.l	d7,d0
	ble.s	loc_0ABBF0
	moveq	#$1,d0
	bra.s	loc_0ABC1C
loc_0ABBF0:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.l	#$13A,d7
	ble.s	loc_0ABC0C
	moveq	#$1,d0
	bra.s	loc_0ABC1C
loc_0ABC0C:
	moveq	#-$64,d1
	cmp.l	d7,d1
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_0ABC1C:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
