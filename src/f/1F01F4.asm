; ---------------------------------------------------------------------------
; XPlayer_CanDoubleJumpNo - XPLAYER slot +$92: base 'can double jump' test, always no
; In:  8(a6) = player
; Out: d0 = 0
; Evidence: NC/Psylocke/Wolverine use XPlayer_CanDoubleJump instead
; ---------------------------------------------------------------------------
XPlayer_CanDoubleJumpNo:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
