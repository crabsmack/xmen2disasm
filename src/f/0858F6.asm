; ---------------------------------------------------------------------------
; Teleporter_StateWaitFade - TELEPORTER state: once the fade is over, restore pausing and the palette code and wait for the next use
; In:  8(a6) = this
; Out: none
; Evidence: when g_PalFadeActive is clear: -$3B04 := 0, g_PauseHandler := Pause_Check, clears +6 bit $1000, state Teleporter_StateWait; TAS 48387
; Found: link-after-rts
; ---------------------------------------------------------------------------
Teleporter_StateWaitFade:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_08592A
	clr.w	-$3B04(a5)
	lea.l	$3FB2(a5),a0
	move.l	a0,g_PauseHandler(a5)
	andi.w	#$EFFF,$6(a4)
	clr.w	$6C(a4)
	lea.l	Teleporter_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08592A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
