; ---------------------------------------------------------------------------
; PowerUp_Collect - POWERUP slot 26 (+$6E) base: flag the HUD for redraw ($FFC94E = 1)
; In:  8(a6) = this  $C(a6) = player
; Out: none
; Evidence: method 26 of Tbl_PowerUp_vtable; every subclass Collect calls it first; the player's AddHealth (XPlayer_AddHealth) sets the same flag
; ---------------------------------------------------------------------------
PowerUp_Collect:
	link.w	a6,#$0
	move.b	#$1,g_HudDirty(a5)
	unlk	a6
	rts
