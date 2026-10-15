; ---------------------------------------------------------------------------
; Magneto_SelectSpriteDef - return the sprite definition Magneto uses on the player-select screen
; In:  none
; Out: d0 = sprite-def pointer
; Evidence: jt data entry lea $3D8A(a5) / move.l 2(a0),d0; called by PlayerSelect_CharSpriteDef case 6, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Magneto_SelectSpriteDef:
	link.w	a6,#$0
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),d0
	unlk	a6
	rts
