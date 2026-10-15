; ---------------------------------------------------------------------------
; BaniMazaB2_InstallTileHooks - install BaniMazaB2's map tile hook (slot -$3AF0 = BaniMazaB2_CrackFloorHook)
; In:  none
; Out: none
; Evidence: clears the 8 hook longs -$3AF8..-$3ADC except -$3AF0; byte -$35C8 = 1
; ---------------------------------------------------------------------------
BaniMazaB2_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	lea.l	BaniMazaB2_CrackFloorHook(pc),a0
	move.l	a0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	unlk	a6
	rts
