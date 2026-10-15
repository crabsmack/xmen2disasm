; ---------------------------------------------------------------------------
; SwampBubbles_Draw - vtable +$1A: draw a SWAMPBUBBLES
; In:  8(a6) = this
; Evidence: slot +$1A of the SWAMPBUBBLES descriptor $0BFCE4; never runs in the corpus
; ---------------------------------------------------------------------------
SwampBubbles_Draw:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d4
	sub.l	d1,d4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.b	$8E(a4),d0
	subq.b	#$1,d0
	bcs.w	loc_0BFC94
	cmpi.b	#$4,d0
	bhi.w	loc_0BFC94
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$BFB90(pc,d1.w),d1
	jmp	$BFB8E(pc,d1.w)
