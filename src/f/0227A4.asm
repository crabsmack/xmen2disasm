; ---------------------------------------------------------------------------
; AvalonB2_InstallTileHooks - install AvalonB2's map tile hooks (only slot -$3AF4 = AvalonB2_TileHook)
; In:  none
; Out: none
; Evidence: clears the 8 hook longs -$3AF8..-$3ADC except -$3AF4, sets byte -$35C8 = 1
; ---------------------------------------------------------------------------
AvalonB2_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	lea.l	AvalonB2_TileHook(pc),a0
	move.l	a0,-$3AF4(a5)
	move.l	d0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	unlk	a6
	rts
