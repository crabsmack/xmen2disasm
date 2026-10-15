; ---------------------------------------------------------------------------
; Pause_HandleInput - pause-screen input: button chords trigger unlocked cheats or start entering a cheat code; Start resumes
; In:  none
; Out: d0
; Evidence: Pad_Update; no code in progress: P1 latch chords $21 health refill (flag $10 of -$3C5E), $22, $24/$28 previous/next scene, $12 players-hit-each-other (unk_Player_005F18), $14/$18 previous/next stage group, $11 invincible ($7FFF health); locked -> g_PauseCheatPtr = code sequence (other table when pad 2 holds Left+Right); in progress: each press must match, $FF end -> Pause_CheatUnlock case; Start by a live player -> g_PauseExit
; ---------------------------------------------------------------------------
Pause_HandleInput:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	clr.b	-$3A08(a5)
	jsr	$50FA(a5)	; -> Pad_Update
	tst.l	g_PauseCheatPtr(a5)
	beq.w	loc_15C5F2
	moveq	#$7F,d0
	and.w	g_Pad1Pressed(a5),d0
	beq.w	loc_15CA36
	moveq	#$7F,d6
	and.w	g_Pad1Pressed(a5),d6
	movea.l	g_PauseCheatPtr(a5),a0
	cmp.b	(a0),d6
	bne.w	loc_15C5E4
	addq.l	#$1,g_PauseCheatPtr(a5)
	movea.l	g_PauseCheatPtr(a5),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$FF,d0
	bne.w	loc_15CA36
	move.w	-$3C58(a5),d0
	subq.w	#$1,d0
	bmi.w	Pause_HandleInput_EndCode
	cmpi.w	#$8,d0
	bgt.w	Pause_HandleInput_EndCode
	add.w	d0,d0
	move.w	Sw_15C42A(pc,d0.w),d0
	jmp	Sw_15C42A-2(pc,d0.w)
