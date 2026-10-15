; ---------------------------------------------------------------------------
; AvalonA4_SwitchTileHook - map tile hook: tile $84 at (x,y) becomes $89 with sound $1A
; In:  8(a6) = word column, $C(a6) = word row
; Out: d0 = 1
; Evidence: installed in -$3AF4 by AvalonA4_InstallTileHooks; Map_SetBlockFG set tile
; ---------------------------------------------------------------------------
AvalonA4_SwitchTileHook:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	ext.l	d6
	movea.l	g_FgRowTable(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d5
	and.w	(a0,d0.l),d5
	cmpi.w	#$84,d5
	bne.s	loc_0351EC
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($89).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
loc_0351EC:
	moveq	#$1,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
