; ---------------------------------------------------------------------------
; Pal_StartFade - start a palette fade from a given level (in from 0 upward, or out from a non-zero level downward)
; In:  8(a6) = word: start level (0 = fade in, else fade out)   $C(a6) = word: palette line or -1 for all   $10(a6) = pointer: fade table
; Out: none
; Evidence: timer g_PalFadeTimer = 0, delay g_PalFadeDelay = 4, level g_PalFadeLevel, direction g_PalFadeUp = (level == 0), line g_PalFadeLine, table g_PalFadeTable; applies the first step (Pal_ApplyFade) and sets active byte g_PalFadeActive(a5); Pal_Update advances it
; ---------------------------------------------------------------------------
Pal_StartFade:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	clr.w	g_PalFadeTimer(a5)
	move.w	#$4,g_PalFadeDelay(a5)
	move.w	d7,g_PalFadeLevel(a5)
	move.b	#$1,g_PalFadeUp(a5)
	tst.w	d7
	beq.s	loc_1FD9BE
	clr.b	g_PalFadeUp(a5)
loc_1FD9BE:
	move.w	$E(a6),g_PalFadeLine(a5)
	move.l	$10(a6),g_PalFadeTable(a5)
	move.l	g_PalFadeTable(a5),-(a7)
	move.w	g_PalFadeLevel(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Pal_ApplyFade(pc)
	move.b	#$1,g_PalFadeActive(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
