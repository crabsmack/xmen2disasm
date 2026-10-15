; ---------------------------------------------------------------------------
; sub_15C39A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_15C39A:
	link.w	a6,#$0
	move.b	g_SpriteTable+$B(a5),d0
	ext.w	d0
	move.w	d0,-$3C5A(a5)
	beq.s	loc_15C418
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15C3E2
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15C3E2
	move.b	#$4,g_SpriteTable+$B(a5)
	bra.s	loc_15C418
loc_15C3E2:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_15C412
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15C418
loc_15C412:
	move.b	#$2,g_SpriteTable+$B(a5)
loc_15C418:
	unlk	a6
	rts
