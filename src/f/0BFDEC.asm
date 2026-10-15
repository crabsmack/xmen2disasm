; ---------------------------------------------------------------------------
; SwampPlatform_Move - bob up and down: y = base y (+$12) minus a triangle wave of the frame counter (phase +$8C, period 256, peak $80 >> +$9B), never above (level header g_LevelFgMap word +4) x 8 - $1A (SWAMPPLATFORM override of slot +$4E Move; no velocity)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$4E of the SWAMPPLATFORM descriptor $0C005A; TAS frames 28316-30469 (422 frames active)
; ---------------------------------------------------------------------------
SwampPlatform_Move:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8C(a4),d0
	ext.l	d0
	move.l	g_FrameCounter(a5),d1
	sub.l	d0,d1
	move.l	#$FF,d7
	and.l	d1,d7
	cmpi.l	#$80,d7
	ble.s	loc_0BFE1E
	move.l	#$100,d0
	sub.l	d7,d0
	move.l	d0,d7
loc_0BFE1E:
	moveq	#$0,d0
	move.b	$9B(a4),d0
	asr.l	d0,d7
	move.w	$12(a4),d0
	ext.l	d0
	sub.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	movea.l	g_LevelFgMap(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	moveq	#$1A,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bls.s	loc_0BFE62
	movea.l	g_LevelFgMap(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	moveq	#$1A,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_0BFE62:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
