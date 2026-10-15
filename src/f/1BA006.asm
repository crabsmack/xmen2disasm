; ---------------------------------------------------------------------------
; Psylocke_SelectSpriteDef - return the sprite definition Psylocke uses on the player-select screen
; In:  none
; Out: d0 = sprite-def pointer
; Evidence: jt data entry lea $464A(a5) / move.l 2(a0),d0; called by PlayerSelect_CharSpriteDef case 4, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Psylocke_SelectSpriteDef:
	link.w	a6,#$0
	lea.l	$464A(a5),a0
	move.l	$2(a0),d0
	unlk	a6
	rts
