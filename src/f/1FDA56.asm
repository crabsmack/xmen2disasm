; ---------------------------------------------------------------------------
; Pad_Update - per-frame pad edge detection for both players: held, newly pressed, released, latched and accumulated buttons
; In:  none
; Out: none
; Evidence: P1: pressed g_Pad1Pressed = new & ~old, released g_Pad1Released = old & ~new, held g_Pad1Held, latch g_Pad1Latch = (pressed|latch) & held, accum g_Pad1Accum |= held; P2 the same at g_Pad2Pressed/g_Pad2Released/g_Pad2Held/g_Pad2Latch/g_Pad2Accum; the pause code tests pressed & $80 (Start)
; ---------------------------------------------------------------------------
Pad_Update:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	Pad_Get(pc)
	move.w	d0,d7
	move.w	g_Pad1Held(a5),d0
	not.w	d0
	and.w	d7,d0
	move.w	d0,g_Pad1Pressed(a5)
	move.w	d7,d0
	not.w	d0
	and.w	g_Pad1Held(a5),d0
	move.w	d0,g_Pad1Released(a5)
	move.w	d7,d6
	move.w	d6,g_Pad1Held(a5)
	move.w	g_Pad1Pressed(a5),d0
	or.w	g_Pad1Latch(a5),d0
	move.w	d6,d1
	and.w	d0,d1
	move.w	d1,g_Pad1Latch(a5)
	move.w	d6,d0
	or.w	g_Pad1Accum(a5),d0
	move.w	d0,g_Pad1Accum(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Pad_Get(pc)
	move.w	d0,d7
	move.w	g_Pad2Held(a5),d0
	not.w	d0
	and.w	d7,d0
	move.w	d0,g_Pad2Pressed(a5)
	move.w	d7,d0
	not.w	d0
	and.w	g_Pad2Held(a5),d0
	move.w	d0,g_Pad2Released(a5)
	move.w	d7,d6
	move.w	d6,g_Pad2Held(a5)
	move.w	g_Pad2Pressed(a5),d0
	or.w	g_Pad2Latch(a5),d0
	move.w	d6,d1
	and.w	d0,d1
	move.w	d1,g_Pad2Latch(a5)
	move.w	d6,d0
	or.w	g_Pad2Accum(a5),d0
	move.w	d0,g_Pad2Accum(a5)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
