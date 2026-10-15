; ---------------------------------------------------------------------------
; SentinelsB1_FrameHook - SentinelsB1 per-frame hook: camera field +$42 = 200, count the frame, run the Sentinels palette animation (twice at half rate)
; In:  none
; Out: d0
; Evidence: g_Camera+$42, g_FrameCounter, sub_0DC2CE unless g_PalFadeActive; TAS 5209-7290
; ---------------------------------------------------------------------------
SentinelsB1_FrameHook:
	link.w	a6,#$0
	movea.l	g_Camera(a5),a0
	move.w	#$C8,$42(a0)
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0F4334
	jsr	$23F2(a5)	; -> sub_0DC2CE
loc_0F4334:
	tst.b	-$38DE(a5)
	beq.s	loc_0F434C
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0F434C
	jsr	$23F2(a5)	; -> sub_0DC2CE
loc_0F434C:
	unlk	a6
	rts
