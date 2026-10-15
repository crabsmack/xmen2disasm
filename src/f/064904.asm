; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_None - PlayerSelect_CharSpriteDef default: no character, return 0
; In:  none
; Out: d0 = 0
; Evidence: out-of-range branch of PlayerSelect_CharSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_None:
	moveq	#$0,d0
	movea.l	d0,a4
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
