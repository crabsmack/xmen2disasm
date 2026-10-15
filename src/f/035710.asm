; ---------------------------------------------------------------------------
; AvalonA4_InstallTileHooks - install AvalonA4's four map tile hooks
; In:  none
; Out: none
; Evidence: -$3AF4..-$3AE8 = sub_03518C, sub_0351F8, sub_035322, sub_0355A6; others 0; byte -$35C8 = 1
; ---------------------------------------------------------------------------
AvalonA4_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	lea.l	sub_03518C(pc),a0
	move.l	a0,-$3AF4(a5)
	lea.l	sub_0351F8(pc),a0
	move.l	a0,-$3AF0(a5)
	lea.l	sub_035322(pc),a0
	move.l	a0,-$3AEC(a5)
	lea.l	sub_0355A6(pc),a0
	move.l	a0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	unlk	a6
	rts
