; ---------------------------------------------------------------------------
; XClone_SetBgPalette - load one of three background palettes into palette line 2 (1 = $09A148, 2 = $09A168, 3 = $09A188)
; In:  8(a6) = word: palette number
; Out: none
; Evidence: Mem_Copy(g_PalBase+$40, pal, $20), g_PalBaseDirty := 1; 7 callers
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_SetBgPalette:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	subq.w	#$1,d0
	beq.s	loc_099C60
	subq.w	#$1,d0
	beq.s	loc_099C56
	subq.w	#$1,d0
	bne.s	loc_099C60
	lea.l	$195A(a5),a0
	movea.l	$2(a0),a4
	bra.s	loc_099C68
loc_099C56:
	lea.l	$1952(a5),a0
	movea.l	$2(a0),a4
	bra.s	loc_099C68
loc_099C60:
	lea.l	$194A(a5),a0
	movea.l	$2(a0),a4
loc_099C68:
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	g_PalBase+$40(a5)
	jsr	$4DAA(a5)	; -> Mem_Copy
	move.b	#$1,g_PalBaseDirty(a5)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
