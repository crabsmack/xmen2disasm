; ---------------------------------------------------------------------------
; Hornet_MoveStartSwing - Hornet first motion step (+$94 set by Hornet_Init): switch the motion function to Hornet_MoveSwing
; In:  8(a6) = this
; Out: none
; Evidence: only writes +$94 := Hornet_MoveSwing; Hornet_Init installs it so the swing starts on the first Move
; ---------------------------------------------------------------------------
Hornet_MoveStartSwing:
	link.w	a6,#$0
	lea.l	Hornet_MoveSwing(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$94(a1)
	unlk	a6
	rts
