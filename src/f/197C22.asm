; ---------------------------------------------------------------------------
; Wolverine_SelectSpriteDef - return the sprite definition Wolverine uses on the player-select screen
; In:  none
; Out: d0 = sprite-def pointer
; Evidence: jt data entry lea $4442(a5) / move.l 2(a0),d0; called by PlayerSelect_CharSpriteDef case 5, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Wolverine_SelectSpriteDef:
	link.w	a6,#$0
	lea.l	$4442(a5),a0
	move.l	$2(a0),d0
	unlk	a6
	rts
