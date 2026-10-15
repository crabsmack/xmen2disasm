; ---------------------------------------------------------------------------
; Pause_RestoreLink - restore the sprite link saved by Pause_LinkSprites
; In:  none
; Out: none
; Evidence: $FFE231 = $FFC5A7
; ---------------------------------------------------------------------------
Pause_RestoreLink:
	link.w	a6,#$0
	move.b	-$3C59(a5),g_SpriteTable+$B(a5)
	unlk	a6
	rts
