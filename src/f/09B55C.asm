; ---------------------------------------------------------------------------
; BroodClaw_StateEnterView - BROODCLAW state: move into the view (g_CameraX + $30..$144), then install the boss-body and type-$1A segment hooks
; In:  8(a6) = this
; Out: d0
; Evidence: -$340E := CloneA5_SegHook17, -$3402 := CloneA5_SegHook16; next BroodClaw_StateStartScroll; TAS 51931-51951
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodClaw_StateEnterView:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	clr.b	$90(a4)
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$30,d1
	add.l	d1,d0
	cmp.l	d7,d0
	ble.s	loc_09B58C
	move.w	g_CameraX(a5),d6
	add.w	#$30,d6
	bra.s	loc_09B5D4
loc_09B58C:
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$144,d0
	cmp.l	d7,d0
	bge.s	loc_09B5A8
	move.w	g_CameraX(a5),d6
	add.w	#$144,d6
	bra.s	loc_09B5D4
loc_09B5A8:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$143A(a5),a0
	move.l	a0,g_SegTypeHooks+$5C(a5)
	lea.l	$1432(a5),a0
	move.l	a0,g_SegTypeHooks+$68(a5)
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateStartScroll(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09B600
loc_09B5D4:
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_09B5E4
	move.l	#$FFFFFCC0,d0
	bra.s	loc_09B5EA
loc_09B5E4:
	move.l	#$340,d0
loc_09B5EA:
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateEnterView(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B600:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
