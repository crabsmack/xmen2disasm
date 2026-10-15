; ---------------------------------------------------------------------------
; BaniMazaA1_FrameHook - BaniMazaA1 per-frame hook: frame counter, switch cooldown, block animation; every 8th frame set palette colour 15 from an 8-step sequence
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook by BaniMazaA1_InstallFrameHook; Sw_0389B6 on (counter >> 3) & 7 writes $E0/$C0/$A0/$80 into -$3962 (g_PalBase colour 15)
; ---------------------------------------------------------------------------
BaniMazaA1_FrameHook:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0389C8
	moveq	#$2,d0
	bra.s	loc_0389CA
loc_0389C8:
	moveq	#$1,d0
loc_0389CA:
	move.w	d0,d7
loc_0389CC:
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.w	-$3C94(a5)
	beq.s	loc_0389E2
	move.w	-$3C94(a5),d0
	subq.w	#$1,-$3C94(a5)
loc_0389E2:
	moveq	#$7,d0
	and.l	g_FrameCounter(a5),d0
	bne.s	BaniMazaA1_FrameHook_tail
	move.l	g_FrameCounter(a5),d0
	lsr.l	#$3,d0
	moveq	#$7,d1
	and.l	d0,d1
	add.l	d1,d1
	move.w	Sw_0389B6(pc,d1.l),d1
	jmp	Sw_0389B6-2(pc,d1.w)
