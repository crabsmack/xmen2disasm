; ---------------------------------------------------------------------------
; Hologram_VBlankFlicker - make the hologram flicker: on odd V-blanks rewrite a sprite-table link byte in VRAM so part of the sprite chain is skipped
; In:  none
; Out: none
; Evidence: writes VDP $C00004/$C00000 at VRAM $F000 + idx*8 + 2 (sprite link), g_VBlankCount bit 0, armed by Hologram_SetPose($1B) via $FFC620; exported as jt[1275]; TAS 7581-9574
; ---------------------------------------------------------------------------
Hologram_VBlankFlicker:
	tst.b	g_VBlankFrameDone(a5)
	beq.s	loc_0EAEBE
	tst.b	-$3BE0(a5)
	beq.s	loc_0EAEBE
	move.w	-$3BDE(a5),-$3BDC(a5)
	move.b	-$3BDD(a5),-$3BDF(a5)
	beq.s	loc_0EAEFA
	lea.l	g_SpriteTable(a5),a0
	moveq	#$0,d0
	move.b	-$3BDC(a5),d0
	lsl.w	#$3,d0
	move.b	$2(a0,d0.w),-$3BDA(a5)
	clr.b	-$3BE0(a5)
loc_0EAEBE:
	tst.b	-$3BDF(a5)
	beq.s	loc_0EAEFA
	move.b	-$3BDB(a5),d1
	moveq	#$1,d0
	and.l	g_VBlankCount(a5),d0
	beq.s	loc_0EAED6
	move.b	-$3BDC(a5),d1
	addq.w	#$1,d1
loc_0EAED6:
	move.b	d1,-$3BD9(a5)
	moveq	#$0,d0
	move.b	-$3BDC(a5),d0
	lsl.w	#$3,d0
	addq.w	#$2,d0
	swap	d0
	ori.l	#$70000003,d0
	move.l	d0,($C00004).l
	move.w	-$3BDA(a5),($C00000).l
loc_0EAEFA:
	rts
