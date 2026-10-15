; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_None - PlayerSelect_CharFrameNum default: no character, return $FF
; In:  none
; Out: d0 = $FF
; Evidence: out-of-range branch of PlayerSelect_CharFrameNum
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_None:
	move.w	#$FF,d7
	move.w	d7,d0
	move.l	-$4(a6),d7
	unlk	a6
	rts
